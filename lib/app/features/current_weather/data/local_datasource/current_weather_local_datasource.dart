import 'package:app_test_cloudwalk/app/common/local_datasource/manager/i_local_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/local_datasource/models/local_data.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/local_datasource/i_current_weather_local_datasource.dart';

class CurrentWeatherLocalDataSource implements ICurrentWeatherLocalDataSource {
  const CurrentWeatherLocalDataSource({
    required this.localDataManager,
  });

  final ILocalDataManager localDataManager;

  @override
  Future<LocalData> getCurrentWeather(String cityName) async {
    return await localDataManager.get(store: 'current_weather_$cityName');
  }

  @override
  Future<void> saveCurrentWeather(
    String cityName,
    Map<String, dynamic> data,
  ) async {
    return await localDataManager.eraseAndAdd(
      store: 'current_weather_$cityName',
      data: data,
    );
  }
}
