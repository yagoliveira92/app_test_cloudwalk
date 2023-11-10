import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_period_day_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_period_day_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ForecastPeriodDayModel tModel = ForecastPeriodDayModel(
    pod: "1",
  );

  const tMap = {
    "pod": "1",
  };

  test('Deve retornar uma instância de ForecastPeriodDayEntity', () {
    expect(tModel, isA<ForecastPeriodDayEntity>());
  });

  test('Deve retornar um modelo válido (ForecastPeriodDayModel)', () {
    final result = ForecastPeriodDayModel.fromJson(tMap);
    expect(result, isA<ForecastPeriodDayEntity>());
  });
}
