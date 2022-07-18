import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/data/datasources/aws_data_source.dart';
import 'package:motosapp/src/features/motorcycle/data/models/motorcycle_model.dart';
import 'package:motosapp/src/features/motorcycle/data/repositories/motorcycle_repository_impl.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/shared/errors/exceptions.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import 'motorcycle_repository_test.mocks.dart';

@GenerateMocks([AWSDataSource])
void main() {
  late MotorcycleRepository motorcycleRepository;
  late AWSDataSource mockAWSDataSource;
  const List<MotorcycleModel> listMotorcycleModel = [];
  setUp((){
    mockAWSDataSource = MockAWSDataSource();
    motorcycleRepository = MotorcycleRepositoryImpl(awsDataSource: mockAWSDataSource);
  });

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

}