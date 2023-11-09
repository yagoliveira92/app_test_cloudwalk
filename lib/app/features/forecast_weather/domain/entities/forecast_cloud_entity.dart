import 'package:equatable/equatable.dart';

class ForecastCloudEntity extends Equatable {
  final int all;

  const ForecastCloudEntity({
    required this.all,
  });

  ForecastCloudEntity copyWith({
    int? all,
  }) {
    return ForecastCloudEntity(
      all: all ?? this.all,
    );
  }

  @override
  List<Object?> get props => [all];
}
