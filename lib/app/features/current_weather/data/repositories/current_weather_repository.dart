import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/local_datasource/current_weather_local_datasource.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/models/current_weather_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/remote_datasource/current_weather_remote_datasource.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';

class CurrentWeatherRepository implements ICurrentWeatherRepository {
  final CurrentWeatherRemoteDataSource remoteDataSource;
  final CurrentWeatherLocalDataSource localDataSource;

  CurrentWeatherRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<({Failure error, CurrentWeatherEntity currentWeather})>
      getCurrentWeather({required String city}) async {
    try {
      final response = await remoteDataSource.getCurrentWeather(city: city);
      if (response.isSuccess) {
        final currentWeather = CurrentWeatherModel.fromJson(response.data);
        await localDataSource.saveCurrentWeather(city, response.data);
        return (error: NoFailure(), currentWeather: currentWeather);
      }
      if (response.noConnection) {
        final localData = await localDataSource.getCurrentWeather(city);
        if (localData.hasData) {
          final currentWeather = CurrentWeatherModel.fromJson(localData.data);
          return (error: ConnectionFailure(), currentWeather: currentWeather);
        }
        return (
          error: GeneralFailure(),
          currentWeather: const CurrentWeatherEntity()
        );
      }
      return (
        error: GeneralFailure(),
        currentWeather: const CurrentWeatherEntity()
      );
    } catch (e) {
      return (
        error: GeneralFailure(),
        currentWeather: const CurrentWeatherEntity()
      );
    }
  }
}
