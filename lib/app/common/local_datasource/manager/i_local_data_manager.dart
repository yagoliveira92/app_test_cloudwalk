import 'package:sembast/sembast.dart';

import '../models/local_data.dart';

abstract class ILocalDataManager {
  Future<void> start();

  Future<LocalData> get({
    required String store,
    Finder? query,
  });

  Future<List<LocalData>> getAll({
    required String store,
  });

  Future<void> add({
    required String store,
    required Map<String, dynamic> data,
  });

  Future<void> addById({
    required String store,
    required String id,
    required Map<String, dynamic> data,
  });

  Future<void> addAll({
    required String store,
    required List<Map<String, dynamic>> data,
  });

  Future<void> update({
    required String store,
    required Map<String, dynamic> data,
    Finder? query,
  });

  Future<void> eraseAndAdd({
    required String store,
    required Map<String, dynamic> data,
  });

  Future<void> eraseAndAddById({
    required String store,
    required String id,
    required Map<String, dynamic> data,
  });

  Future<void> erase({
    required String store,
  });

  Future<void> delete({
    required String store,
  });

  Future<void> eraseAll();
}
