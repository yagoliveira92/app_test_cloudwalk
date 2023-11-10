import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_weather_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ForecastWeatherModel tModel = ForecastWeatherModel(
    cod: "200",
    message: 0,
    cnt: 40,
    list: [],
    city: null,
  );

  const tMap = {
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [],
    "city": null,
  };

  test('Deve retornar uma instância de ForecastWeatherEntity', () {
    expect(tModel, isA<ForecastWeatherEntity>());
  });

  test('Deve retornar um modelo válido (ForecastWeatherModel)', () {
    final result = ForecastWeatherModel.fromJson(tMap);
    expect(result, isA<ForecastWeatherEntity>());
  });
}
