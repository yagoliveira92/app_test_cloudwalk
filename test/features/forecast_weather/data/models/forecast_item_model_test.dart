import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_item_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ForecastItemModel tModel = ForecastItemModel(
    dt: 1,
    main: null,
    weather: null,
    clouds: null,
    wind: null,
    visibility: 1,
    pop: 1,
    sys: null,
    dtTxt: "1",
    rain: null,
  );

  const tMap = {
    "dt": 1,
    "main": null,
    "weather": null,
    "clouds": null,
    "wind": null,
    "visibility": 1,
    "pop": 1,
    "sys": null,
    "dt_txt": "1",
    "rain": null,
  };

  test('Deve retornar uma instância de ForecastItemEntity', () {
    expect(tModel, isA<ForecastItemEntity>());
  });

  test('Deve retornar um modelo válido (ForecastItemModel)', () {
    final result = ForecastItemModel.fromJson(tMap);
    expect(result, isA<ForecastItemEntity>());
  });
}
