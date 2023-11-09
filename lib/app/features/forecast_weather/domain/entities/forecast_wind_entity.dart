import 'package:equatable/equatable.dart';

class ForecastWindEntity extends Equatable {
  final double? speed;
  final int? deg;
  final double? gust;

  const ForecastWindEntity({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  @override
  List<Object?> get props => [speed, deg, gust];
}
