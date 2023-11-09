import 'package:app_test_cloudwalk/app/common/local_datasource/manager/i_local_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/local_datasource/models/local_data.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/local_datasource/i_forecast_weather_local_datasource.dart';

class ForecastWeatherLocalDataSource
    implements IForecastWeatherLocalDataSource {
  const ForecastWeatherLocalDataSource({
    required this.localDataManager,
  });

  final ILocalDataManager localDataManager;

  @override
  Future<LocalData> getForecastWeather(String cityName) async {
    return await localDataManager.get(store: 'forecast_weather_$cityName');
  }

  @override
  Future<void> saveForecastWeather(
    String cityName,
    Map<String, dynamic> data,
  ) async {
    return await localDataManager.eraseAndAdd(
      store: 'forecast_weather_$cityName',
      data: data,
    );
  }
}
