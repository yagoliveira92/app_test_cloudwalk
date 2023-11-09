import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';

class GetForecastWeatherUseCase {
  final IForecastWeatherRepository repository;

  GetForecastWeatherUseCase({required this.repository});

  Future<({Failure error, ForecastWeatherEntity forecastWeather})> call(
      String city) async {
    return await repository.getForecastWeather(city: city);
  }
}
