import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/main_weather_condition_entity.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/weather_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_cloud_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_period_day_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_rain_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_wind_entity.dart';
import 'package:equatable/equatable.dart';

class ForecastItemEntity extends Equatable {
  final int? dt;
  final MainWeatherCondiditonEntity? main;
  final List<WeatherEntity>? weather;
  final ForecastCloudEntity? clouds;
  final ForecastWindEntity? wind;
  final int? visibility;
  final double? pop;
  final ForecastPeriodDayEntity? sys;
  final String? dtTxt;
  final ForecastRainEntity? rain;

  const ForecastItemEntity({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.rain,
  });

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        sys,
        dtTxt,
        rain,
      ];
}
