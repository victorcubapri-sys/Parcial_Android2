import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database/app_database.dart';
import '../data/repositories/workshop_repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  ref.keepAlive();
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final workshopRepositoryProvider = Provider<WorkshopRepository>((ref) {
  ref.keepAlive();
  return WorkshopRepository(ref.watch(databaseProvider));
});

final ordersProvider = StreamProvider((ref) {
  ref.keepAlive();
  return ref.watch(workshopRepositoryProvider).watchOrders();
});

final openOrdersProvider = StreamProvider((ref) {
  ref.keepAlive();
  return ref.watch(workshopRepositoryProvider).watchOpenOrders();
});

final sparePartsProvider = StreamProvider((ref) {
  ref.keepAlive();
  return ref.watch(workshopRepositoryProvider).watchSpareParts();
});

final techniciansProvider = StreamProvider((ref) {
  ref.keepAlive();
  return ref.watch(workshopRepositoryProvider).watchTechnicians();
});
