import 'package:app_test_cloudwalk/app/features/current_weather/data/models/coordinator_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/models/current_weather_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/models/main_weather_condition_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/models/weather_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const CurrentWeatherModel tModel = CurrentWeatherModel(
    coord: CoordinatorModel(lon: 1.0, lat: 1.0),
    main: MainWeatherConditionModel(
        temp: 1.0,
        feelsLike: 1.0,
        tempMin: 1.0,
        tempMax: 1.0,
        pressure: 1,
        humidity: 1),
    name: 'Teste',
    weatherEntities: <WeatherModel>[
      WeatherModel(id: 1, main: 'Teste', description: 'Teste', icon: 'Teste')
    ],
  );

  const tMap = {
    "coord": {
      "lon": 1.0,
      "lat": 1.0,
    },
    "weather": [
      {"id": 1, "main": "Teste", "description": "Teste", "icon": "Teste"}
    ],
    "base": "stations",
    "main": {
      "temp": 1.0,
      "feels_like": 1.0,
      "temp_min": 1.0,
      "temp_max": 1.0,
      "pressure": 1,
      "humidity": 1
    },
    "visibility": 10000,
    "wind": {"speed": 1.0, "deg": 1},
    "clouds": {"all": 1},
    "dt": 1621430400,
    "sys": {
      "type": 1,
      "id": 8394,
      "country": "BR",
      "sunrise": 1621389315,
      "sunset": 1621431630
    },
    "timezone": -10800,
    "id": 3468879,
    "name": "Teste",
    "cod": 200
  };

  test('Deve retornar uma instância de CurrentWeatherEntity', () {
    expect(tModel, isA<CurrentWeatherEntity>());
  });

  test('Deve retornar um modelo válido (CoordinatorModel)', () {
    final result = CurrentWeatherModel.fromJson(tMap);
    expect(result, isA<CurrentWeatherEntity>());
  });
}
