import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/i_remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/endpoint.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/methods_enum.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/remote_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataManager extends Mock implements IRemoteDataManager {}

class MockEndPoint extends Mock implements Endpoint {}

void main() {
  late MockRemoteDataManager remoteDataManager;

  setUp(() {
    remoteDataManager = MockRemoteDataManager();
    registerFallbackValue(MockEndPoint());
  });

  final tLocalData = RemoteData();
  final tEndpoint = Endpoint(method: Methods.post, path: '/app-cloudwalk.');

  test('should return a RemoteData when call a request', () async {
    when(
      () => remoteDataManager.request(
        endpoint: any(named: 'endpoint'),
      ),
    ).thenAnswer(
      (_) async => tLocalData,
    );
    final result = await remoteDataManager.request(
      endpoint: tEndpoint,
    );
    expect(result, isA<RemoteData>());
  });
}
