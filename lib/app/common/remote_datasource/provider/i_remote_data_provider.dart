import 'package:dio/dio.dart';

abstract class IRemoteDataProvider {
  void configureRequest({
    required bool isFormUrlEncoded,
  });

  Future<Response?> get({
    required String path,
    Map<String, dynamic>? query,
  });

  Future<Response?> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  });

  Future<Response?> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  });

  Future<Response?> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  });

  Future<Response?> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  });
}
