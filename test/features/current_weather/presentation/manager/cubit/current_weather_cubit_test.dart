import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/presentation/manager/cubit/current_weather_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCurrentWeatherUseCase extends Mock
    implements GetCurrentWeatherUseCase {}

void main() {
  late MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCase;
  late CurrentWeatherCubit cubit;

  setUp(() {
    mockGetCurrentWeatherUseCase = MockGetCurrentWeatherUseCase();
    cubit = CurrentWeatherCubit(
      getCurrentWeatherUsecase: mockGetCurrentWeatherUseCase,
    );
  });

  final listCurrent = <CurrentWeatherEntity>[
    const CurrentWeatherEntity(),
    const CurrentWeatherEntity(),
    const CurrentWeatherEntity(),
    const CurrentWeatherEntity(),
  ];

  tearDown(() => cubit.close());

  group('Obter dados do Current Weather (Cubit)', () {
    test('Deve retornar o estado inicial correto', () {
      expect(cubit.state, CurrentWeatherInitial());
    });

    blocTest<CurrentWeatherCubit, CurrentWeatherState>(
      'Deve emitir o estado de sucesso',
      build: () {
        when(
          () => mockGetCurrentWeatherUseCase(),
        ).thenAnswer(
          (_) async => (
            currentWeatherList: listCurrent,
            error: NoFailure(),
          ),
        );

        return cubit;
      },
      act: (cubit) async => cubit.getCurrentWeather(),
      expect: () => <CurrentWeatherState>[
        CurrentWeatherLoading(),
        CurrentWeatherSuccess(
          currentWeatherList: listCurrent,
        ),
      ],
    );

    blocTest<CurrentWeatherCubit, CurrentWeatherState>(
      'Deve emitir o estado de Erro',
      build: () {
        when(
          () => mockGetCurrentWeatherUseCase(),
        ).thenAnswer(
          (_) async => (
            currentWeatherList: <CurrentWeatherEntity>[],
            error: GeneralFailure(),
          ),
        );
        return cubit;
      },
      act: (cubit) async => cubit.getCurrentWeather(),
      expect: () => <CurrentWeatherState>[
        CurrentWeatherLoading(),
        CurrentWeatherError(),
      ],
    );
  });
}
