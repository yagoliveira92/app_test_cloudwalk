part of 'current_weather_cubit.dart';

@immutable
abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();
}

class CurrentWeatherInitial extends CurrentWeatherState {
  @override
  List<Object?> get props => [];
}

class CurrentWeatherLoading extends CurrentWeatherState {
  @override
  List<Object?> get props => [];
}

class CurrentWeatherError extends CurrentWeatherState {
  @override
  List<Object?> get props => [];
}

class CurrentWeatherSuccess extends CurrentWeatherState {
  const CurrentWeatherSuccess({
    required this.currentWeatherList,
    this.noConnection = false,
  });

  final List<CurrentWeatherEntity> currentWeatherList;
  final bool noConnection;
  @override
  List<Object?> get props => [
        currentWeatherList,
        noConnection,
      ];
}
