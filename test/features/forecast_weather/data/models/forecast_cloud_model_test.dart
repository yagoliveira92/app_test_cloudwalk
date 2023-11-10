import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_cloud_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_cloud_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ForecastCloudModel tModel = ForecastCloudModel(
    all: 1,
  );

  const tMap = {
    "all": 1,
  };

  test('Deve retornar uma instância de ForecastCloudEntity', () {
    expect(tModel, isA<ForecastCloudEntity>());
  });

  test('Deve retornar um modelo válido (ForecastCloudModel)', () {
    final result = ForecastCloudModel.fromJson(tMap);
    expect(result, isA<ForecastCloudEntity>());
  });
}
