import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_period_day_entity.dart';

class ForecastPeriodDayModel extends ForecastPeriodDayEntity {
  const ForecastPeriodDayModel({required super.pod});

  factory ForecastPeriodDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastPeriodDayModel(pod: json['pod']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }
}
