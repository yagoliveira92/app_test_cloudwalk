import 'package:app_test_cloudwalk/app/features/current_weather/data/models/coordinator_model.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/coordinator_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const CoordinatorModel tCoordinator = CoordinatorModel(
    lon: 1.0,
    lat: 1.0,
  );

  const tMap = {
    "lon": 1.0,
    "lat": 1.0,
  };

  test('Deve retornar uma instância de CoordinatorEntity', () {
    expect(tCoordinator, isA<CoordinatorEntity>());
  });

  test('Deve retornar um modelo válido (CoordinatorModel)', () {
    final result = CoordinatorModel.fromJson(tMap);
    expect(result, isA<CoordinatorEntity>());
  });
}
