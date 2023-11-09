import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/coordinator_entity.dart';

class CoordinatorModel extends CoordinatorEntity {
  const CoordinatorModel({super.lon, final double? lat});

  factory CoordinatorModel.fromJson(Map<String, dynamic> json) {
    return CoordinatorModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}
