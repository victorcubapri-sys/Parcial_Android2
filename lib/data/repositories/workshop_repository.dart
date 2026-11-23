import 'package:drift/drift.dart';
import '../database/app_database.dart';

class WorkshopRepository {
  WorkshopRepository(this.db);
  final AppDatabase db;

  Stream<List<RepairOrder>> watchOrders() =>
      (db.select(db.repairOrders)..orderBy([(t) => OrderingTerm.desc(t.receivedAt)])).watch();

  Stream<List<SparePart>> watchSpareParts() =>
      (db.select(db.spareParts)..where((t) => t.active.equals(true))).watch();

  Stream<List<Technician>> watchTechnicians() =>
      (db.select(db.technicians)..where((t) => t.active.equals(true))).watch();

  Future<int> createTechnician(String name) {
    return db.into(db.technicians).insert(TechniciansCompanion.insert(
      name: name.trim(),
    ));
  }

  Future<int> createSparePart({
    required String name,
    required String code,
    required int unitPriceCents,
    required int quantity,
    required int minimumStock,
    String? description,
  }) {
    return db.into(db.spareParts).insert(SparePartsCompanion.insert(
      name: name.trim(),
      code: code.trim().toUpperCase(),
      unitPriceCents: unitPriceCents,
      quantity: Value(quantity),
      minimumStock: Value(minimumStock),
      description: Value(description?.trim().isEmpty == true ? null : description?.trim()),
    ));
  }

  Stream<List<RepairOrder>> watchOpenOrders() =>
      (db.select(db.repairOrders)
        ..where((t) => t.status.isNotIn(['Entregada', 'Cancelada']))
        ..orderBy([(t) => OrderingTerm.desc(t.receivedAt)])).watch();

  Future<int> createClient(String name, String phone) {
    return db.into(db.clients).insert(ClientsCompanion.insert(
      fullName: name.trim(), phone: phone.trim(),
    ));
  }

  Future<int> createDevice({
    required int clientId,
    required String type,
    required String brand,
    required String model,
    String? serialNumber,
  }) {
    return db.into(db.devices).insert(DevicesCompanion.insert(
      clientId: clientId, type: type, brand: brand, model: model,
      serialNumber: Value(serialNumber?.trim().isEmpty == true ? null : serialNumber?.trim()),
    ));
  }

  Future<int> createOrder({
    required int clientId,
    required int deviceId,
    required String issue,
  }) async {
    final now = DateTime.now();
    final code = 'TS-${now.millisecondsSinceEpoch}';
    return db.into(db.repairOrders).insert(RepairOrdersCompanion.insert(
      code: code, clientId: clientId, deviceId: deviceId,
      reportedIssue: issue.trim(),
      receivedAt: Value(now), updatedAt: Value(now),
    ));
  }

  Future<void> updateOrderStatus(int id, String status) async {
    const allowed = {'Recibida', 'En reparación', 'Lista', 'Entregada', 'Cancelada'};
    if (!allowed.contains(status)) throw ArgumentError('Estado no válido');
    await (db.update(db.repairOrders)..where((t) => t.id.equals(id))).write(
      RepairOrdersCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
        deliveredAt: status == 'Entregada' ? Value(DateTime.now()) : const Value.absent(),
      ),
    );
  }

  Future<void> assignTechnician(int orderId, int technicianId) async {
    final technician = await (db.select(db.technicians)
      ..where((t) => t.id.equals(technicianId) & t.active.equals(true))).getSingleOrNull();
    if (technician == null) throw StateError('El técnico no existe o está inactivo.');
    await (db.update(db.repairOrders)..where((t) => t.id.equals(orderId))).write(
      RepairOrdersCompanion(
        technicianId: Value(technicianId),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> addRepairJob(int orderId, String description, int costCents) async {
    if (costCents < 0) throw ArgumentError('El costo no puede ser negativo.');
    await db.into(db.repairJobs).insert(RepairJobsCompanion.insert(
      orderId: orderId, description: description.trim(), laborCostCents: costCents,
    ));
  }

  Future<void> useSparePart({
    required int orderId,
    required int sparePartId,
    required int quantity,
  }) async {
    if (quantity <= 0) throw ArgumentError('La cantidad debe ser mayor que cero.');
    await db.transaction(() async {
      final part = await (db.select(db.spareParts)
        ..where((t) => t.id.equals(sparePartId))).getSingle();
      if (part.quantity < quantity) throw StateError('Existencias insuficientes.');
      await (db.update(db.spareParts)..where((t) => t.id.equals(sparePartId))).write(
        SparePartsCompanion(quantity: Value(part.quantity - quantity)),
      );
      await db.into(db.orderSpareParts).insert(OrderSparePartsCompanion.insert(
        orderId: orderId, sparePartId: sparePartId, quantity: quantity,
        unitPriceCents: part.unitPriceCents,
      ));
      await db.into(db.inventoryMovements).insert(InventoryMovementsCompanion.insert(
        sparePartId: sparePartId, orderId: Value(orderId),
        quantityDelta: -quantity, reason: 'Consumo en reparación',
      ));
    });
  }

  Future<void> deleteOrder(int orderId) async {
    await db.transaction(() async {
      await (db.delete(db.repairJobs)..where((t) => t.orderId.equals(orderId))).go();
      await (db.delete(db.orderSpareParts)..where((t) => t.orderId.equals(orderId))).go();
      await (db.delete(db.inventoryMovements)..where((t) => t.orderId.equals(orderId))).go();
      await (db.delete(db.repairOrders)..where((t) => t.id.equals(orderId))).go();
    });
  }

  Future<void> deleteClient(int clientId) async {
    await db.transaction(() async {
      final devices = await (db.select(db.devices)..where((t) => t.clientId.equals(clientId))).get();
      for (final device in devices) {
        final orders = await (db.select(db.repairOrders)..where((t) => t.deviceId.equals(device.id))).get();
        for (final order in orders) {
          await deleteOrder(order.id);
        }
      }
      await (db.delete(db.devices)..where((t) => t.clientId.equals(clientId))).go();
      await (db.delete(db.clients)..where((t) => t.id.equals(clientId))).go();
    });
  }

  Future<void> deleteSparePart(int sparePartId) async {
    await (db.update(db.spareParts)..where((t) => t.id.equals(sparePartId))).write(
      const SparePartsCompanion(active: Value(false)),
    );
  }

  Future<void> deleteTechnician(int technicianId) async {
    await (db.update(db.technicians)..where((t) => t.id.equals(technicianId))).write(
      const TechniciansCompanion(active: Value(false)),
    );
  }
}
