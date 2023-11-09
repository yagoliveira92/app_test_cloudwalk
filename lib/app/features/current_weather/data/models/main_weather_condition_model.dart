import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/main_weather_condition_entity.dart';

class MainWeatherConditionModel extends MainWeatherCondiditonEntity {
  const MainWeatherConditionModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
  });

  factory MainWeatherConditionModel.fromJson(Map<String, dynamic> json) {
    return MainWeatherConditionModel(
      temp: double.parse(json['temp'].toStringAsFixed(2)),
      feelsLike: double.parse(json['feels_like'].toStringAsFixed(2)),
      tempMin: double.parse(json['temp_min'].toStringAsFixed(2)),
      tempMax: double.parse(json['temp_max'].toStringAsFixed(2)),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}
