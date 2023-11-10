import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrentWeatherRepository extends Mock
    implements ICurrentWeatherRepository {}

void main() {
  late GetCurrentWeatherUseCase useCase;
  late MockCurrentWeatherRepository repository;

  final listCurrent = <CurrentWeatherEntity>[
    const CurrentWeatherEntity(),
  ];

  setUp(() {
    repository = MockCurrentWeatherRepository();
    useCase = GetCurrentWeatherUseCase(repository: repository);
  });
  group('Obter d (UserCase)', () {
    test('Sucesso ao obter os dados do Current Weather', () async {
      when(() => repository.getCurrentWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async =>
            (currentWeather: const CurrentWeatherEntity(), error: NoFailure()),
      );
      final result = await useCase();
      expect(result,
          isA<({Failure error, CurrentWeatherEntity currentWeather})>());
      verify(() => repository.getCurrentWeather(city: any(named: 'city')));
      verifyNoMoreInteractions(repository);
    });

    test('Falha ao obter os dados do Dashboard', () async {
      when(() => repository.getCurrentWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async =>
            (currentWeather: const CurrentWeatherEntity(), error: Failure()),
      );
      final result = await useCase();
      expect(result,
          isA<({Failure error, CurrentWeatherEntity currentWeather})>());
      verify(() => repository.getCurrentWeather(city: any(named: 'city')));
      verifyNoMoreInteractions(repository);
    });

    test('Deve retornar o enum correto na bateria ', () async {});
  });
}
