import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../models/local_data.dart';
import 'i_local_data_manager.dart';

class LocalDataManager implements ILocalDataManager {
  late Database _database;

  @override
  Future<void> start() async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    await applicationDirectory.create();
    final path = join(applicationDirectory.path, 'test_app_cloudwalk.db');
    _database = await databaseFactoryIo.openDatabase(path);
  }

  @override
  Future<LocalData> get({
    required String store,
    Finder? query,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    return _database.transaction(
      (transaction) async {
        final snapshot = await storeInstance.find(
          transaction,
          finder: query,
        );
        if (snapshot.isEmpty) return LocalData();
        return LocalData(
          id: snapshot.single.key,
          data: snapshot.single.value,
        );
      },
    );
  }

  @override
  Future<List<LocalData>> getAll({
    required String store,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    return await _database.transaction(
      (transaction) async {
        final snapshotList = await storeInstance.find(
          transaction,
        );
        return snapshotList.map(
          (snapshot) {
            return LocalData(
              id: snapshot.key,
              data: snapshot.value,
            );
          },
        ).toList();
      },
    );
  }

  @override
  Future<void> add({
    required String store,
    required Map<String, dynamic> data,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) {
        return storeInstance.add(
          transaction,
          Map<String, dynamic>.from(data),
        );
      },
    );
  }

  @override
  Future<void> addById({
    required String store,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) async {
        return await storeInstance.record(id).put(
              transaction,
              Map<String, dynamic>.from(data),
              merge: true,
            );
      },
    );
  }

  @override
  Future<void> addAll({
    required String store,
    required List<Map<String, dynamic>> data,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) {
        return storeInstance.addAll(
          transaction,
          data,
        );
      },
    );
  }

  @override
  Future<void> update({
    required String store,
    required Map<String, dynamic> data,
    Finder? query,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) {
        return storeInstance.update(
          transaction,
          data,
          finder: query,
        );
      },
    );
  }

  @override
  Future<void> delete({
    required String store,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) => storeInstance.delete(
        transaction,
      ),
    );
  }

  @override
  Future<void> eraseAndAdd({
    required String store,
    required Map<String, dynamic> data,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) {
        storeInstance.drop(transaction);
        return storeInstance.add(
          transaction,
          Map<String, dynamic>.from(data),
        );
      },
    );
  }

  @override
  Future<void> eraseAndAddById({
    required String store,
    required Map<String, dynamic> data,
    required String id,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) async {
        await storeInstance.delete(
          transaction,
          finder: Finder(
            filter: Filter.byKey(id),
          ),
        );
        return await storeInstance.record(id).put(
              transaction,
              Map<String, dynamic>.from(data),
              merge: true,
            );
      },
    );
  }

  @override
  Future<void> erase({
    required String store,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) => storeInstance.drop(transaction),
    );
  }

  @override
  Future<void> eraseAll() async {
    final factory = databaseFactoryIo;
    await _database.transaction(
      (_) {
        _database.close();
        factory.deleteDatabase(_database.path);
        start();
      },
    );
  }
}
