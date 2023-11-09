import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/coordinator_entity.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/weather_entity.dart';
import 'package:equatable/equatable.dart';

import 'main_weather_condition_entity.dart';

class CurrentWeatherEntity extends Equatable {
  final CoordinatorEntity? coord;
  final List<WeatherEntity>? weatherEntities;
  final MainWeatherCondiditonEntity? main;
  final String? name;

  const CurrentWeatherEntity({
    this.coord,
    this.weatherEntities,
    this.main,
    this.name,
  });

  CurrentWeatherEntity copyWith({
    CoordinatorEntity? coord,
    List<WeatherEntity>? weatherEntities,
    MainWeatherCondiditonEntity? main,
    String? name,
  }) {
    return CurrentWeatherEntity(
      coord: coord ?? this.coord,
      weatherEntities: weatherEntities ?? this.weatherEntities,
      main: main ?? this.main,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [coord, weatherEntities, main];
}
