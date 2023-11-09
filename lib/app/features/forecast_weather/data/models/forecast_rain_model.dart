import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_rain_entity.dart';

class ForecastRainModel extends ForecastRainEntity {
  const ForecastRainModel({super.d3h});

  factory ForecastRainModel.fromJson(Map<String, dynamic> json) {
    return ForecastRainModel(d3h: json['3h']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    return data;
  }
}
