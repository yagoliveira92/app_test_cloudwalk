import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/local_datasource/forecast_weather_local_datasource.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/remote_datasource/forecast_weather_remote_datasource.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_weather_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';

class ForecastWeatherRepository implements IForecastWeatherRepository {
  final ForecastWeatherRemoteDataSource remoteDataSource;
  final ForecastWeatherLocalDataSource localDataSource;

  ForecastWeatherRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<({Failure error, ForecastWeatherEntity forecastWeather})>
      getForecastWeather({required String city}) async {
    try {
      final response = await remoteDataSource.getForecastWeather(city: city);
      if (response.isSuccess) {
        final forecastWeather = ForecastWeatherModel.fromJson(response.data);
        await localDataSource.saveForecastWeather(city, response.data);
        return (error: NoFailure(), forecastWeather: forecastWeather);
      }
      if (response.noConnection) {
        final localData = await localDataSource.getForecastWeather(city);
        if (localData.hasData) {
          final forecastWeather = ForecastWeatherModel.fromJson(localData.data);
          return (error: ConnectionFailure(), forecastWeather: forecastWeather);
        }
        return (
          error: Failure(),
          forecastWeather: const ForecastWeatherEntity()
        );
      }
      return (error: Failure(), forecastWeather: const ForecastWeatherEntity());
    } catch (e) {
      return (error: Failure(), forecastWeather: const ForecastWeatherEntity());
    }
  }
}
