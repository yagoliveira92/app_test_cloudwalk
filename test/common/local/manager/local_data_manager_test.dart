import 'package:app_test_cloudwalk/app/common/local_datasource/manager/i_local_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/local_datasource/models/local_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataManager extends Mock implements ILocalDataManager {}

void main() {
  late MockLocalDataManager localDataManager;

  setUp(() {
    localDataManager = MockLocalDataManager();
  });
  final List<LocalData> tLocalDataList = [];
  final tLocalData = LocalData();

  test('should return a LocalData when get local data in store', () async {
    when(
      () => localDataManager.get(
        store: any(named: 'store'),
      ),
    ).thenAnswer(
      (_) async => tLocalData,
    );
    final result = await localDataManager.get(
      store: 'store',
    );
    expect(result, isA<LocalData>());
  });

  test('should return a LocalData when get all local data items', () async {
    when(
      () => localDataManager.getAll(
        store: any(named: 'store'),
      ),
    ).thenAnswer(
      (_) async => tLocalDataList,
    );
    final result = await localDataManager.getAll(
      store: '',
    );
    expect(result, isA<List<LocalData>>());
  });
}
