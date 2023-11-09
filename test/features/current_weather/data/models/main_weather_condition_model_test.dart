import 'package:app_test_cloudwalk/app/features/current_weather/data/models/main_weather_condition_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/main_weather_condition_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MainWeatherConditionModel tModel = MainWeatherConditionModel(
    temp: 1.0,
    feelsLike: 1.0,
    tempMin: 1.0,
    tempMax: 1.0,
    pressure: 1,
    humidity: 1,
  );

  const tMap = {
    "temp": 1.0,
    "feels_like": 1.0,
    "temp_min": 1.0,
    "temp_max": 1.0,
    "pressure": 1,
    "humidity": 1
  };

  test('Deve retornar uma instância de MainWeatherCondiditonEntity', () {
    expect(tModel, isA<MainWeatherCondiditonEntity>());
  });

  test('Deve retornar um modelo válido (CoordinatorModel)', () {
    final result = MainWeatherConditionModel.fromJson(tMap);
    expect(result, isA<MainWeatherCondiditonEntity>());
  });
}
