import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';

abstract class ICurrentWeatherRepository {
  Future<({Failure error, CurrentWeatherEntity currentWeather})>
      getCurrentWeather({required String city});
}
