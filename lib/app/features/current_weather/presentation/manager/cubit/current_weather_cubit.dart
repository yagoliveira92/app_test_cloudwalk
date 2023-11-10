import 'package:app_test_cloudwalk/app/common/error/failure.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit({
    required this.getCurrentWeatherUsecase,
  }) : super(CurrentWeatherInitial());

  final GetCurrentWeatherUseCase getCurrentWeatherUsecase;

  Future<void> getCurrentWeather() async {
    emit(CurrentWeatherLoading());
    final result = await getCurrentWeatherUsecase();
    if (result.error is! GeneralFailure) {
      emit(
          CurrentWeatherSuccess(currentWeatherList: result.currentWeatherList));
    } else {
      emit(CurrentWeatherError());
    }
  }
}
