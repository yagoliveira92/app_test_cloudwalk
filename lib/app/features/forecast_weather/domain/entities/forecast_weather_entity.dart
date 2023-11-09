import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_city_entity.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_item_entity.dart';
import 'package:equatable/equatable.dart';

class ForecastWeatherEntity extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ForecastItemEntity>? list;
  final ForecastCityEntity? city;

  const ForecastWeatherEntity({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}
