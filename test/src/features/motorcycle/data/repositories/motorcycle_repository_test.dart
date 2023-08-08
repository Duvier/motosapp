import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/data/datasources/datasource.dart';
import 'package:motosapp/src/features/motorcycle/data/models/motorcycle_model.dart';
import 'package:motosapp/src/features/motorcycle/data/repositories/motorcycle_repository_impl.dart';
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/shared/errors/exceptions.dart';
import 'package:motosapp/src/shared/errors/failures.dart';
import 'package:motosapp/src/shared/usescases/usecase.dart';

import 'motorcycle_repository_test.mocks.dart';

@GenerateMocks([DataSource])
void main() {
  late MotorcycleRepository motorcycleRepository;
  late DataSource mockAWSDataSource;
  const List<MotorcycleModel> listMotorcycleModel = [];
  const id = 'id';
  const model = MotorcycleModel(
    id: 'id',
    name: 'La morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  const params = ParamsMotorcycle(
    name: 'La morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  setUp((){
    mockAWSDataSource = MockDataSource();
    motorcycleRepository = MotorcycleRepositoryImpl(dataSource: mockAWSDataSource);
  });
  group('Obtener listado de motos', () {
    test('Debería retornar datos cuando el llamado sea exitoso ', () async {
      // arrange
      when(mockAWSDataSource.getListMotorcycles())
      .thenAnswer((_) async => listMotorcycleModel);
      // act
      final result = await motorcycleRepository.getListMotorcycles();
      // assert
      expect(result, equals(const Right(listMotorcycleModel)));
    });
    test('Debería retornar un ServerFailure cuando el llamado sea fallido ', () async {
      // arrange
      when(mockAWSDataSource.getListMotorcycles())
      .thenThrow(ServerException());
      // act
      final result = await motorcycleRepository.getListMotorcycles();
      // assert
      expect(result, equals(Left(ServerFailure())));
    });
  });
  
  group('Guardar moto', () {
    test('Debería agregar el nuevo registro ', () async {
      // arrange
      when(mockAWSDataSource.saveMotorcycle(params))
      .thenAnswer((_) async => const Right(null));
      // act
      final result = await motorcycleRepository.saveMotorcycle(params);
      // assert
      expect(result, equals(const Right(null)));
      verify(mockAWSDataSource.saveMotorcycle(params));
    });
    test('Debería retornar un ServerFailure cuando falle al guardar el registro', () async {
      // arrange
      when(mockAWSDataSource.saveMotorcycle(params))
      .thenThrow(ServerException());
      // act
      final result = await motorcycleRepository.saveMotorcycle(params);
      // assert
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group('Obtener una moto', () {
    test('Debería retornar una moto cuando el llamado sea exitoso ', () async {
      // arrange
      when(mockAWSDataSource.getMotorcycle(id))
      .thenAnswer((_) async => model);
      // act
      final result = await motorcycleRepository.getMotorcycle(id);
      // assert
      expect(result, equals(const Right(model)));
    });
    test('Debería retornar un ServerFailure cuando el llamado sea fallido ', () async {
      // arrange
      when(mockAWSDataSource.getMotorcycle(id))
      .thenThrow(ServerException());
      // act
      final result = await motorcycleRepository.getMotorcycle(id);
      // assert
      expect(result, equals(Left(ServerFailure())));
    });
  });

}