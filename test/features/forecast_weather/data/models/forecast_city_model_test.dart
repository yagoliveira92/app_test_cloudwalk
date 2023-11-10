import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_city_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_city_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ForecastCityModel tModel = ForecastCityModel(
    id: 1,
    name: "name",
    coord: null,
    country: "country",
    population: 1,
    timezone: 1,
    sunrise: 1,
    sunset: 1,
  );

  const tMap = {
    "id": 1,
    "name": "name",
    "coord": null,
    "country": "country",
    "population": 1,
    "timezone": 1,
    "sunrise": 1,
    "sunset": 1,
  };

  test('Deve retornar uma instância de ForecastCityEntity', () {
    expect(tModel, isA<ForecastCityEntity>());
  });

  test('Deve retornar um modelo válido (CoordinatorModel)', () {
    final result = ForecastCityModel.fromJson(tMap);
    expect(result, isA<ForecastCityEntity>());
  });
}
