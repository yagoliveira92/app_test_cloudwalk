import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_cloud_entity.dart';

class ForecastCloudModel extends ForecastCloudEntity {
  const ForecastCloudModel({required super.all});

  factory ForecastCloudModel.fromJson(Map<String, dynamic> json) {
    return ForecastCloudModel(all: json['all']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}
