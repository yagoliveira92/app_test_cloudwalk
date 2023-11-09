import 'package:app_test_cloudwalk/app/common/connection/connection_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/i_remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/endpoint.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/methods_enum.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/remote_data.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/provider/i_remote_data_provider.dart';
import 'package:dio/dio.dart';

class RemoteDataManager with ConnectionManager implements IRemoteDataManager {
  RemoteDataManager({
    required IRemoteDataProvider dataProvider,
  }) : _dataProvider = dataProvider;

  final IRemoteDataProvider _dataProvider;
  @override
  Future<RemoteData> request({required Endpoint endpoint}) async {
    var response = await _executeRequest(endpoint: endpoint);
    return response;
  }

  Future<RemoteData> _executeRequest({required Endpoint endpoint}) async {
    if (await hasNetworkConnection) {
      _dataProvider.configureRequest(
        isFormUrlEncoded: endpoint.isFormUrlEncoded,
      );
      Response? response;
      switch (endpoint.method) {
        case Methods.get:
          response = await _dataProvider.get(
            path: endpoint.path,
            query: endpoint.query,
          );
          break;
        case Methods.post:
          response = await _dataProvider.post(
            path: endpoint.path,
            query: endpoint.query,
            data: endpoint.data,
          );
          break;
        case Methods.put:
          response = await _dataProvider.put(
            path: endpoint.path,
            query: endpoint.query,
            data: endpoint.data,
          );
          break;
        case Methods.patch:
          response = await _dataProvider.patch(
            path: endpoint.path,
            query: endpoint.query,
            data: endpoint.data,
          );
          break;
        case Methods.delete:
          response = await _dataProvider.delete(
            path: endpoint.path,
            query: endpoint.query,
            data: endpoint.data,
          );
          break;
      }
      return RemoteData(
        data: response?.data,
        statusCode: response?.statusCode,
      );
    }
    return RemoteData(noConnection: true);
  }
}
