import 'package:app_test_cloudwalk/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrentWeatherRepository extends Mock
    implements ICurrentWeatherRepository {}

void main() {
  late GetCurrentWeatherUseCase useCase;
  late MockCurrentWeatherRepository repository;

  setUp(() {
    repository = MockCurrentWeatherRepository();
    useCase = GetCurrentWeatherUseCase(repository: repository);
  });
  group('Obter d (UserCase)', () {
    test('Sucesso ao obter os dados do Dashboard', () async {
      when(() => repository.getCurrentWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async => Right(
          List<SensorsEntity>.empty(),
        ),
      );
      final result = await sensorsUserCase();
      expect(result, isA<Right<String, List<SensorsEntity>>>());
      verify(() => mockSensorsRepository.getAllSensors());
      verifyNoMoreInteractions(mockSensorsRepository);
    });

    test('Falha ao obter os dados do Dashboard', () async {
      when(
        () => mockSensorsRepository.getAllSensors(),
      ).thenAnswer((_) async => Left('Erro'));
      final result = await sensorsUserCase();
      expect(result, Left<String, List<SensorsEntity>>('Erro'));
      verify(() => mockSensorsRepository.getAllSensors());
      verifyNoMoreInteractions(mockSensorsRepository);
    });

    test('Deve retornar o enum correto na bateria ', () async {
      final result = sensorsUserCase.getBattery(
        itemDescription: DescriptionSensorsEntity(
          description: 'Teste',
          shortDescription: 'Teste',
          name: 'bv1',
          value: 'full',
        ),
      );
      expect(result, BatteryEnum.full);
    });

    test('Deve retornar o enum correto no item de sensor', () async {
      final result = sensorsUserCase.getTypeItemSensor(
        itemDescription: DescriptionSensorsEntity(
          description: 'Teste',
          shortDescription: 'Teste',
          name: 'pl1',
          value: '30.56496',
        ),
      );
      expect(result, ItemSensorEnum.pl1);
    });

    test('Deve retornar o valor correto no parse de double (Sucesso)',
        () async {
      final result = sensorsUserCase.checkParse(
        description: DescriptionSensorsEntity(
          description: 'Teste',
          shortDescription: 'Teste',
          name: 'pl1',
          value: '30.56496',
        ),
      );
      expect(result, '30.6');
    });

    test('Deve retornar o valor correto no parse de double (Erro)', () async {
      final result = sensorsUserCase.checkParse(
        description: DescriptionSensorsEntity(
          description: 'Teste',
          shortDescription: 'Teste',
          name: 'bv1',
          value: 'full',
        ),
      );
      expect(result, '-');
    });

    test('Deve retornar corretamente a tabela de solo', () async {
      final result = sensorsUserCase.makeSoilTable(
        soilDescription: DescriptionSensorsEntity(
          description: 'Teste',
          shortDescription: 'Teste',
          name: 'st1',
          depth: '10',
          value: '30.56496',
        ),
        soilTable: SoilTableEntity(),
      );
      expect(
        result.soilVariables[0].depth == '10' &&
            result.headerTable[0] == SoilVariableEnum.temperature &&
            result.soilVariables[0].soilRowValues[0].typeSoil ==
                SoilVariableEnum.temperature &&
            result.soilVariables[0].soilRowValues[0].value == '30.6',
        true,
      );
    });

    test('Deve adicionar corretamente o item no header da tabela de solo',
        () async {
      final result = sensorsUserCase.searchAndAddSoilTableHeader(
        soilTableHeader: [],
        soilEnum: SoilVariableEnum.temperature,
      );
      expect(result[0] == SoilVariableEnum.temperature, true);
    });

    test('Deve ignorar corretamente o item no header da tabela de solo',
        () async {
      final result = sensorsUserCase.searchAndAddSoilTableHeader(
        soilTableHeader: [SoilVariableEnum.temperature],
        soilEnum: SoilVariableEnum.temperature,
      );
      expect(result.length == 1, true);
    });

    test('Deve adicionar corretamente o item no corpo da tabela de solo',
        () async {
      final result = sensorsUserCase.searchAndAddSoilRow(
          soilDescription: DescriptionSensorsEntity(
            description: 'Teste',
            shortDescription: 'Teste',
            name: 'st1',
            depth: '10',
            value: '30.56496',
          ),
          soilVariables: [],
          soilRowValue: SoilRowValuesEntity(
            value: '30.6',
            typeSoil: SoilVariableEnum.temperature,
          ));
      expect(
          result[0].depth == '10' &&
              result[0].soilRowValues[0].typeSoil ==
                  SoilVariableEnum.temperature &&
              result[0].soilRowValues[0].value == '30.6',
          true);
    });

    test('Deve inserir corretamente o item no corpo da tabela de solo',
        () async {
      final result = sensorsUserCase.searchAndAddSoilRow(
          soilDescription: DescriptionSensorsEntity(
            description: 'Teste',
            shortDescription: 'Teste',
            name: 'vic1',
            depth: '10',
            value: '35.56496',
          ),
          soilVariables: [
            SoilRowEntity(
              depth: '10',
              soilRowValues: [
                SoilRowValuesEntity(
                  value: '30.6',
                  typeSoil: SoilVariableEnum.temperature,
                ),
              ],
            )
          ],
          soilRowValue: SoilRowValuesEntity(
            value: '35.6',
            typeSoil: SoilVariableEnum.ions,
          ));
      expect(
          result[0].depth == '10' &&
              result.length == 1 &&
              result[0].soilRowValues[0].typeSoil ==
                  SoilVariableEnum.temperature &&
              result[0].soilRowValues[0].value == '30.6' &&
              result[0].soilRowValues[1].typeSoil == SoilVariableEnum.ions &&
              result[0].soilRowValues[1].value == '35.6',
          true);
    });
  });
}
