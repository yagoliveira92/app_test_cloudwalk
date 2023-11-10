import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_rain_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_rain_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ForecastRainModel tModel = ForecastRainModel(
    d3h: 1,
  );

  const tMap = {
    "pod": "1",
  };

  test('Deve retornar uma instância de ForecastRainEntity', () {
    expect(tModel, isA<ForecastRainEntity>());
  });

  test('Deve retornar um modelo válido (ForecastRainModel)', () {
    final result = ForecastRainModel.fromJson(tMap);
    expect(result, isA<ForecastRainEntity>());
  });
}
