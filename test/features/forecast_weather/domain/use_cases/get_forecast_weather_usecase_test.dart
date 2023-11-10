import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockForecastWeatherRepository extends Mock
    implements IForecastWeatherRepository {}

void main() {
  late GetForecastWeatherUseCase useCase;
  late MockForecastWeatherRepository repository;

  const tMock = ForecastWeatherEntity();

  setUp(() {
    repository = MockForecastWeatherRepository();
    useCase = GetForecastWeatherUseCase(repository: repository);
  });
  group('Obter dados do GetForecastWeather (UserCase)', () {
    test('Sucesso ao obter os dados do Forecast Weather', () async {
      when(() => repository.getForecastWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async => (
          forecastWeather: const ForecastWeatherEntity(),
          error: NoFailure()
        ),
      );
      final result = await useCase('aracaju');
      expect(result.forecastWeather, tMock);
      expect(result.error, isA<NoFailure>());
    });

    test('Falha ao obter os dados do Current Weather', () async {
      when(() => repository.getForecastWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async => (
          forecastWeather: const ForecastWeatherEntity(),
          error: GeneralFailure()
        ),
      );
      final result = await useCase('aracaju');
      expect(result.forecastWeather, const ForecastWeatherEntity());
      expect(result.error, isA<GeneralFailure>());
    });
  });
}
