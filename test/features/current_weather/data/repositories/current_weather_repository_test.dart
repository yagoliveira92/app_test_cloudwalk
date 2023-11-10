import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/common/local_datasource/models/local_data.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/remote_data.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/local_datasource/current_weather_local_datasource.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/remote_datasource/current_weather_remote_datasource.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/repositories/current_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataSource extends Mock
    implements CurrentWeatherLocalDataSource {}

class MockRemoteDataSource extends Mock
    implements CurrentWeatherRemoteDataSource {}

void main() {
  late CurrentWeatherRepository repository;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = CurrentWeatherRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('Obter dados para CurrentWeather (Repository)', () {
    const tMapWidgets = {
      "coord": {"lon": -48.61, "lat": -27.59},
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "base": "stations",
      "main": {
        "temp": 26.5,
        "feels_like": 26.5,
        "temp_min": 26.5,
        "temp_max": 26.5,
        "pressure": 1014,
        "humidity": 61
      },
      "visibility": 10000,
      "wind": {"speed": 3.6, "deg": 90},
      "clouds": {"all": 75},
      "dt": 1630671600,
      "sys": {
        "type": 2,
        "id": 2030384,
        "country": "BR",
        "sunrise": 1630648490,
        "sunset": 1630693440
      },
      "timezone": -10800,
      "id": 3461789,
      "name": "Jóia",
      "cod": 200
    };

    test('deve retornar sucesso na obtenção dos dados remoto', () async {
      when(() =>
              mockRemoteDataSource.getCurrentWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async => RemoteData(
          data: tMapWidgets,
          statusCode: 200,
        ),
      );

      when(
        () => mockLocalDataSource.saveCurrentWeather(
          any(),
          any(),
        ),
      ).thenAnswer(
        (_) async => true,
      );

      final result = await repository.getCurrentWeather(city: 'aracaju');
      expect(
        result,
        isA<({Failure error, CurrentWeatherEntity currentWeather})>(),
      );
    });

    test('deve retornar sucesso na obtenção dos dados locais', () async {
      when(
        () => mockRemoteDataSource.getCurrentWeather(city: any(named: 'city')),
      ).thenAnswer(
        (_) async => RemoteData(noConnection: true),
      );

      when(
        () => mockLocalDataSource.getCurrentWeather(any()),
      ).thenAnswer(
        (_) async => LocalData(data: tMapWidgets),
      );

      final result = await repository.getCurrentWeather(city: 'aracaju');
      expect(
        result,
        isA<({Failure error, CurrentWeatherEntity currentWeather})>(),
      );
    });

    test('deve retornar erro na obtenção dos dados remoto', () async {
      when(
        () => mockRemoteDataSource.getCurrentWeather(city: any(named: 'city')),
      ).thenAnswer(
        (_) async => RemoteData(noConnection: true),
      );

      final result = await repository.getCurrentWeather(city: 'aracaju');
      expect(
        result,
        isA<({Failure error, CurrentWeatherEntity currentWeather})>(),
      );
    });
  });
}
