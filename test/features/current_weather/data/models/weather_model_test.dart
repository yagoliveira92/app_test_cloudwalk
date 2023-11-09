import 'package:app_test_cloudwalk/app/features/current_weather/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WeatherModel tModel = const WeatherModel(
    id: 1,
    main: 'Teste',
    description: 'Teste',
    icon: 'Teste',
  );

  const tMap = {
    "id": 1,
    "main": "Teste",
    "description": "Teste",
    "icon": "Teste"
  };

  test('Deve retornar uma instância de WeatherEntity', () {
    expect(tModel, isA<WeatherModel>());
  });

  test('Deve retornar um modelo válido (WeatherModel)', () {
    final result = WeatherModel.fromJson(tMap);
    expect(result, isA<WeatherModel>());
  });
}
