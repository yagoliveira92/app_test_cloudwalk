import 'package:app_test_cloudwalk/app/features/current_weather/data/models/main_weather_condition_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/models/weather_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_cloud_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_period_day_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_rain_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_wind_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_item_entity.dart';

class ForecastItemModel extends ForecastItemEntity {
  const ForecastItemModel({
    super.dt,
    super.main,
    super.weather,
    super.clouds,
    super.wind,
    super.visibility,
    super.pop,
    super.sys,
    super.dtTxt,
    super.rain,
  });

  factory ForecastItemModel.fromJson(Map<String, dynamic> json) {
    return ForecastItemModel(
      dt: json['dt'],
      main: json['main'] != null
          ? MainWeatherConditionModel.fromJson(json['main'])
          : null,
      weather: json['weather'] != null
          ? (json['weather'] as List)
              .map((e) => WeatherModel.fromJson(e))
              .toList()
          : null,
      clouds: json['clouds'] != null
          ? ForecastCloudModel.fromJson(json['clouds'])
          : null,
      wind: json['wind'] != null
          ? ForecastWindModel.fromJson(json['wind'])
          : null,
      visibility: json['visibility'],
      pop: double.parse(json['pop'].toStringAsFixed(2)),
      sys: json['sys'] != null
          ? ForecastPeriodDayModel.fromJson(json['sys'])
          : null,
      dtTxt: json['dt_txt'],
      rain: json['rain'] != null
          ? ForecastRainModel.fromJson(json['rain'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = (main! as MainWeatherConditionModel).toJson();
    }
    if (weather != null) {
      data['weather'] =
          weather!.map((v) => (v as WeatherModel).toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = (clouds! as ForecastCloudModel).toJson();
    }
    if (wind != null) {
      data['wind'] = (wind! as ForecastWindModel).toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (sys != null) {
      data['sys'] = (sys! as ForecastPeriodDayModel).toJson();
    }
    data['dt_txt'] = dtTxt;
    if (rain != null) {
      data['rain'] = (rain! as ForecastRainModel).toJson();
    }
    return data;
  }
}
