import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_wind_entity.dart';

class ForecastWindModel extends ForecastWindEntity {
  const ForecastWindModel({super.speed, super.deg, super.gust});

  factory ForecastWindModel.fromJson(Map<String, dynamic> json) {
    return ForecastWindModel(
      speed: double.parse(json['speed'].toStringAsFixed(2)),
      deg: json['deg'],
      gust: double.parse(json['gust'].toStringAsFixed(2)),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}
