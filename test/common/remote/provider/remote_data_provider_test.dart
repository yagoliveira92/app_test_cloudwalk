import 'package:app_test_cloudwalk/app/common/remote_datasource/provider/i_remote_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataProvider extends Mock implements IRemoteDataProvider {}

void main() {
  late MockRemoteDataProvider remoteDataProvider;

  setUp(() {
    remoteDataProvider = MockRemoteDataProvider();
  });

  final tResponse =
      Response(requestOptions: RequestOptions(path: 'app-cloudwalk/'));

  test('should return a Response when get remove data provider in endpoint',
      () async {
    when(
      () => remoteDataProvider.get(
        path: any(named: 'path'),
        query: any(named: 'query'),
      ),
    ).thenAnswer(
      (_) async => tResponse,
    );
    final result = await remoteDataProvider.get(
      path: '',
      query: {},
    );
    expect(result, isA<Response>());
  });

  test('should return a Response when call post in data provider', () async {
    when(
      () => remoteDataProvider.post(
        path: any(named: 'path'),
        query: any(named: 'query'),
      ),
    ).thenAnswer(
      (_) async => tResponse,
    );
    final result = await remoteDataProvider.post(
      path: '',
      query: {},
    );
    expect(result, isA<Response>());
  });

  test('should return a Response when call put in data provider', () async {
    when(
      () => remoteDataProvider.put(
        path: any(named: 'path'),
        query: any(named: 'query'),
      ),
    ).thenAnswer(
      (_) async => tResponse,
    );
    final result = await remoteDataProvider.put(
      path: '',
      query: {},
    );
    expect(result, isA<Response>());
  });

  test('should return a Response when call patch in data provider', () async {
    when(
      () => remoteDataProvider.patch(
        path: any(named: 'path'),
        query: any(named: 'query'),
      ),
    ).thenAnswer(
      (_) async => tResponse,
    );
    final result = await remoteDataProvider.patch(
      path: '',
      query: {},
    );
    expect(result, isA<Response>());
  });

  test('should return a Response when call delete in data provider', () async {
    when(
      () => remoteDataProvider.delete(
        path: any(named: 'path'),
        query: any(named: 'query'),
      ),
    ).thenAnswer(
      (_) async => tResponse,
    );
    final result = await remoteDataProvider.delete(
      path: '',
      query: {},
    );
    expect(result, isA<Response>());
  });
}
