import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/presentation/manager/cubit/forecast_weather_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetForecastWeatherUseCase extends Mock
    implements GetForecastWeatherUseCase {}

void main() {
  late MockGetForecastWeatherUseCase mockGetForecastWeatherUseCase;
  late ForecastWeatherCubit cubit;

  setUp(() {
    mockGetForecastWeatherUseCase = MockGetForecastWeatherUseCase();
    cubit = ForecastWeatherCubit(
      getForecastWeatherUseCase: mockGetForecastWeatherUseCase,
    );
  });

  const tMock = ForecastWeatherEntity();

  tearDown(() => cubit.close());

  group('Obter dados do Current Weather (Cubit)', () {
    test('Deve retornar o estado inicial correto', () {
      expect(cubit.state, ForecastWeatherInitial());
    });

    blocTest<ForecastWeatherCubit, ForecastWeatherState>(
      'Deve emitir o estado de sucesso',
      build: () {
        when(
          () => mockGetForecastWeatherUseCase(any()),
        ).thenAnswer(
          (_) async => (
            forecastWeather: tMock,
            error: NoFailure(),
          ),
        );

        return cubit;
      },
      act: (cubit) async => cubit.getForecast(city: 'aracaju'),
      expect: () => <ForecastWeatherState>[
        ForecastWeatherLoading(),
        const ForecastWeatherSuccess(
          forecastWeatherEntity: tMock,
        ),
      ],
    );

    blocTest<ForecastWeatherCubit, ForecastWeatherState>(
      'Deve emitir o estado de Erro',
      build: () {
        when(
          () => mockGetForecastWeatherUseCase(any()),
        ).thenAnswer(
          (_) async => (
            forecastWeather: const ForecastWeatherEntity(),
            error: GeneralFailure(),
          ),
        );
        return cubit;
      },
      act: (cubit) async => cubit.getForecast(city: 'aracaju'),
      expect: () => <ForecastWeatherState>[
        ForecastWeatherLoading(),
        ForecastWeatherError(),
      ],
    );
  });
}
