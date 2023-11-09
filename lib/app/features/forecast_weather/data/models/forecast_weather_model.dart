import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_city_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/models/forecast_item_model.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';

class ForecastWeatherModel extends ForecastWeatherEntity {
  const ForecastWeatherModel(
      {super.cod, super.message, super.cnt, super.list, super.city});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: json['list'] != null
          ? (json['list'] as List)
              .map((e) => ForecastItemModel.fromJson(e))
              .toList()
          : null,
      city: json['city'] != null
          ? ForecastCityModel.fromJson(json['city'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] =
          list!.map((v) => (v as ForecastItemModel).toJson()).toList();
    }
    if (city != null) {
      data['city'] = (city! as ForecastCityModel).toJson();
    }
    return data;
  }
}
