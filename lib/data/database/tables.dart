import 'package:drift/drift.dart';

class Technicians extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
}

class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text()();
  TextColumn get phone => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Devices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  TextColumn get type => text()();
  TextColumn get brand => text()();
  TextColumn get model => text()();
  TextColumn get serialNumber => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class RepairOrders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().unique()();
  IntColumn get clientId => integer().references(Clients, #id)();
  IntColumn get deviceId => integer().references(Devices, #id)();
  IntColumn get technicianId => integer().nullable().references(Technicians, #id)();
  TextColumn get reportedIssue => text()();
  TextColumn get status => text().withDefault(const Constant('Recibida'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get receivedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deliveredAt => dateTime().nullable()();
}

class RepairJobs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId => integer().references(RepairOrders, #id)();
  TextColumn get description => text()();
  IntColumn get laborCostCents => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class SpareParts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get code => text().unique()();
  TextColumn get description => text().nullable()();
  IntColumn get unitPriceCents => integer()();
  IntColumn get quantity => integer().withDefault(const Constant(0))();
  IntColumn get minimumStock => integer().withDefault(const Constant(1))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
}

class OrderSpareParts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId => integer().references(RepairOrders, #id)();
  IntColumn get sparePartId => integer().references(SpareParts, #id)();
  IntColumn get quantity => integer()();
  IntColumn get unitPriceCents => integer()();
}

class InventoryMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sparePartId => integer().references(SpareParts, #id)();
  IntColumn get orderId => integer().nullable().references(RepairOrders, #id)();
  IntColumn get quantityDelta => integer()();
  TextColumn get reason => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
