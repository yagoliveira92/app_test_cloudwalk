import 'package:app_test_cloudwalk/app/features/current_weather/data/models/coordinator_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/models/main_weather_condition_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/models/weather_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  const CurrentWeatherModel({
    required super.coord,
    required super.weatherEntities,
    required super.main,
    required super.name,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      name: json['name'],
      coord: json['coord'] != null
          ? CoordinatorModel.fromJson(json['coord'])
          : null,
      weatherEntities: json['weather'] != null
          ? (json['weather'] as List)
              .map((e) => WeatherModel.fromJson(e))
              .toList()
          : null,
      main: json['main'] != null
          ? MainWeatherConditionModel.fromJson(json['main'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = (coord! as CoordinatorModel).toJson();
    }
    if (weatherEntities != null) {
      data['weather'] = weatherEntities!
          .map((weather) => (weather as WeatherModel).toJson())
          .toList();
    }
    if (main != null) {
      data['main'] = (main! as MainWeatherConditionModel).toJson();
    }
    return data;
  }
}
