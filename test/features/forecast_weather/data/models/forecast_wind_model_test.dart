import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_wind_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_wind_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ForecastWindModel tModel = ForecastWindModel(
    speed: 0,
    deg: 0,
    gust: 0,
  );

  const tMap = {
    "speed": 0,
    "deg": 0,
    "gust": 0,
  };

  test('Deve retornar uma instância de ForecastWeatherEntity', () {
    expect(tModel, isA<ForecastWindEntity>());
  });

  test('Deve retornar um modelo válido (ForecastWindModel)', () {
    final result = ForecastWindModel.fromJson(tMap);
    expect(result, isA<ForecastWindEntity>());
  });
}
