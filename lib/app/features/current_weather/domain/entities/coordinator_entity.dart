import 'package:equatable/equatable.dart';

class CoordinatorEntity extends Equatable {
  final double? lon;
  final double? lat;

  const CoordinatorEntity({this.lon, this.lat});

  CoordinatorEntity copyWith({
    double? lon,
    double? lat,
  }) {
    return CoordinatorEntity(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  @override
  List<Object?> get props => [lon, lat];
}
