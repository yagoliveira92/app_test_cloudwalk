import 'package:equatable/equatable.dart';

class ForecastRainEntity extends Equatable {
  final double? d3h;
  const ForecastRainEntity({
    required this.d3h,
  });

  @override
  List<Object?> get props => [d3h];
}
