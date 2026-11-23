import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Technicians, Clients, Devices, RepairOrders, RepairJobs,
  SpareParts, OrderSpareParts, InventoryMovements,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await batch((b) {
        b.insertAll(technicians, [
          TechniciansCompanion.insert(name: 'Técnico 1'),
          TechniciansCompanion.insert(name: 'Técnico 2'),
          TechniciansCompanion.insert(name: 'Técnico 3'),
        ]);
        b.insertAll(spareParts, [
          SparePartsCompanion.insert(
            name: 'Conector USB-C', code: 'REP-USB-C',
            unitPriceCents: 85000, quantity: const Value(8),
            minimumStock: const Value(3),
          ),
          SparePartsCompanion.insert(
            name: 'Batería universal', code: 'REP-BAT-01',
            unitPriceCents: 180000, quantity: const Value(5),
            minimumStock: const Value(2),
          ),
          SparePartsCompanion.insert(
            name: 'Módulo de cámara', code: 'REP-CAM-01',
            unitPriceCents: 250000, quantity: const Value(1),
            minimumStock: const Value(2),
          ),
        ]);
      });
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'tu_solution.sqlite'));
    return NativeDatabase(file);
  });
}
