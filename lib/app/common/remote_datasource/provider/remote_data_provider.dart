import 'package:app_test_cloudwalk/app/common/constants/app_constants_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/interceptor/remote_data_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'i_remote_data_provider.dart';

class RemoteDataProvider implements IRemoteDataProvider {
  RemoteDataProvider({required IAppConstantsManager appConstants}) {
    _dio = Dio(
      BaseOptions(baseUrl: appConstants.apiBaseUrl),
    )..interceptors.add(RemoteDataInterceptor());
  }

  late final Dio _dio;

  @override
  void configureRequest({
    required bool isFormUrlEncoded,
  }) {
    _dio.options.headers = <String, dynamic>{
      'Content-Type': 'application/json',
    };
    if (isFormUrlEncoded) {
      _dio.options.contentType = Headers.formUrlEncodedContentType;
    }
  }

  @override
  Future<Response?> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: query,
      );
    } on DioException catch (error) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        error.stackTrace,
        reason: error.response?.statusMessage ?? '',
        information: [error.toString()],
      );
      FirebaseCrashlytics.instance.setCustomKey('api_error',
          'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return error.response;
    }
  }

  @override
  Future<Response?> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (error) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        error.stackTrace,
        reason: error.response?.statusMessage ?? '',
        information: [error.toString()],
      );
      FirebaseCrashlytics.instance.setCustomKey('api_error',
          'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return error.response;
    }
  }

  @override
  Future<Response?> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _dio.put(
        path,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (error) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        error.stackTrace,
        reason: error.response?.statusMessage ?? '',
        information: [error.toString()],
      );
      FirebaseCrashlytics.instance.setCustomKey('api_error',
          'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return error.response;
    }
  }

  @override
  Future<Response?> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _dio.patch(
        path,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (error) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        error.stackTrace,
        reason: error.response?.statusMessage ?? '',
        information: [error.toString()],
      );
      FirebaseCrashlytics.instance.setCustomKey('api_error',
          'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return error.response;
    }
  }

  @override
  Future<Response?> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _dio.delete(
        path,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (error) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        error.stackTrace,
        reason: error.response?.statusMessage ?? '',
        information: [error.toString()],
      );
      FirebaseCrashlytics.instance.setCustomKey('api_error',
          'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}, route: ${error.response?.realUri}');
      return error.response;
    }
  }
}
