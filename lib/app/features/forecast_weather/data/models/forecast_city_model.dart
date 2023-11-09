import 'package:app_test_cloudwalk/app/features/current_weather/data/models/coordinator_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_city_entity.dart';

class ForecastCityModel extends ForecastCityEntity {
  const ForecastCityModel(
      {super.id,
      super.name,
      super.coord,
      super.country,
      super.population,
      super.timezone,
      super.sunrise,
      super.sunset});

  factory ForecastCityModel.fromJson(Map<String, dynamic> json) {
    return ForecastCityModel(
      id: json['id'],
      name: json['name'],
      coord: json['coord'] != null
          ? CoordinatorModel.fromJson(json['coord'])
          : null,
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = (coord! as CoordinatorModel).toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
