import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/coordinator_entity.dart';
import 'package:equatable/equatable.dart';

class ForecastCityEntity extends Equatable {
  final int? id;
  final String? name;
  final CoordinatorEntity? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const ForecastCityEntity(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}
