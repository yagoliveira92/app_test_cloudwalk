import 'package:equatable/equatable.dart';

class ForecastPeriodDayEntity extends Equatable {
  const ForecastPeriodDayEntity({
    required this.pod,
  });

  final String pod;

  @override
  List<Object?> get props => [pod];
}
