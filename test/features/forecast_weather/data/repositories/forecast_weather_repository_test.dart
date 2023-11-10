import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/common/local_datasource/models/local_data.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/remote_data.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/local_datasource/forecast_weather_local_datasource.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/remote_datasource/forecast_weather_remote_datasource.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/repositories/forecast_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataSource extends Mock
    implements ForecastWeatherLocalDataSource {}

class MockRemoteDataSource extends Mock
    implements ForecastWeatherRemoteDataSource {}

void main() {
  late ForecastWeatherRepository repository;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = ForecastWeatherRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('Obter dados para ForecastWeather (Repository)', () {
    const tMap = {
      "cod": "200",
      "message": 0,
      "cnt": 40,
      "list": [
        {
          "dt": 1699304400,
          "main": {
            "temp": 21.44,
            "feels_like": 21.23,
            "temp_min": 18.9,
            "temp_max": 21.44,
            "pressure": 1020,
            "sea_level": 1020,
            "grnd_level": 932,
            "humidity": 61,
            "temp_kf": 2.54
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": {"all": 0},
          "wind": {"speed": 4.96, "deg": 147, "gust": 5.33},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2023-11-06 21:00:00"
        },
      ]
    };

    test('deve retornar sucesso na obtenção dos dados remoto', () async {
      when(() =>
              mockRemoteDataSource.getForecastWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async => RemoteData(
          data: tMap,
          statusCode: 200,
        ),
      );

      when(
        () => mockLocalDataSource.saveForecastWeather(
          any(),
          any(),
        ),
      ).thenAnswer(
        (_) async => true,
      );

      final result = await repository.getForecastWeather(city: 'aracaju');
      expect(
        result,
        isA<({Failure error, ForecastWeatherEntity forecastWeather})>(),
      );
    });

    test('deve retornar sucesso na obtenção dos dados locais', () async {
      when(
        () => mockRemoteDataSource.getForecastWeather(city: any(named: 'city')),
      ).thenAnswer(
        (_) async => RemoteData(noConnection: true),
      );

      when(
        () => mockLocalDataSource.getForecastWeather(any()),
      ).thenAnswer(
        (_) async => LocalData(data: tMap),
      );

      final result = await repository.getForecastWeather(city: 'aracaju');
      expect(
        result,
        isA<({Failure error, ForecastWeatherEntity forecastWeather})>(),
      );
    });

    test('deve retornar erro na obtenção dos dados remoto', () async {
      when(
        () => mockRemoteDataSource.getForecastWeather(city: any(named: 'city')),
      ).thenAnswer(
        (_) async => RemoteData(noConnection: true),
      );

      final result = await repository.getForecastWeather(city: 'aracaju');
      expect(
        result,
        isA<({Failure error, ForecastWeatherEntity forecastWeather})>(),
      );
    });
  });
}
