import 'dart:async';

import 'package:new_app/data/todo_item/database_connection.dart';
import 'package:sembast/sembast.dart';

class SembastStore {
  final DatabaseConnection _databaseConnection = DatabaseConnection();
  final StoreRef _store;
  final _streamController =
  StreamController<List<Map<String, dynamic>>>.broadcast();

  Stream<List<Map<String, dynamic>>> get records => _streamController.stream;

  SembastStore({required String name})
      : _store = stringMapStoreFactory.store(name);

  Future init() async {
    final db = await _databaseConnection.db;
    final query = _store.query(finder: Finder());
    query.onSnapshots(db).listen((snapshots) {
      final records = snapshots
          .map((snapshot) => snapshot.value as Map?)
          .map((map) => Map<String, dynamic>.from(map!))
          .toList();
      _streamController.add(records);
    });
  }

  Future<Map<String, dynamic>> load({required String id}) async {
    final db = await _databaseConnection.db;
    final storeRecord = _store.record(id);
    final result = await storeRecord.get(db) as Map;
    return Map.from(result);
  }

  Future<Map<String, dynamic>> update(
      {required String id, required Map<String, dynamic> record}) async {
    final db = await _databaseConnection.db;
    return db.transaction((transaction) async {
      final key = id;
      final storeRecord = _store.record(key);
      final result = await storeRecord.update(transaction, record) as Map;
      return Map.from(result);
    });
  }

  Future<Map<String, dynamic>> upsert(
      {required String id, required Map<String, dynamic> record}) async {
    final db = await _databaseConnection.db;
    return db.transaction((transaction) async {
      final key = id;
      final storeRecord = _store.record(key);
      final result = await storeRecord.put(transaction, record) as Map;
      return Map.from(result);
    });
  }

  Future<void> deleteSingleItem(String id) async {
    final db = await _databaseConnection.db;
    return db.transaction((transaction) async {
      final key = id;
      final storeRecord = _store.record(key);
      await storeRecord.delete(transaction);
    });
  }

  Future<int> deleteAll() async {
    final db = await _databaseConnection.db;
    return db.transaction((transaction) async {
      return await _store.delete(transaction);
    });
  }
}