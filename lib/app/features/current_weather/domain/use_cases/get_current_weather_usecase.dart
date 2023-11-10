import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/use_cases/enums/cities_concert_weather_enum.dart';

class GetCurrentWeatherUseCase {
  final ICurrentWeatherRepository repository;

  GetCurrentWeatherUseCase({required this.repository});

  Future<({Failure error, List<CurrentWeatherEntity> currentWeatherList})>
      call() async {
    List<CurrentWeatherEntity> currentWeatherList = [];
    final resultSilverstone = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.silverstone.getCity,
    );
    if (resultSilverstone.error is! GeneralFailure) {
      currentWeatherList.add(resultSilverstone.currentWeather);
    }
    final resultSaoPaulo = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.saoPaulo.getCity,
    );
    if (resultSaoPaulo.error is! GeneralFailure) {
      currentWeatherList.add(resultSaoPaulo.currentWeather);
    }
    final resultMelbourne = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.melbourne.getCity,
    );
    if (resultMelbourne.error is! GeneralFailure) {
      currentWeatherList.add(resultMelbourne.currentWeather);
    }
    final resultMonteCarlo = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.monteCarlo.getCity,
    );
    if (resultMonteCarlo.error is! GeneralFailure) {
      currentWeatherList.add(resultMonteCarlo.currentWeather);
    }

    if (currentWeatherList.isEmpty) {
      return (error: GeneralFailure(), currentWeatherList: currentWeatherList);
    }
    return (error: NoFailure(), currentWeatherList: currentWeatherList);
  }
}
