import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/maintenance/data/repositories/maintenance_type_repository_impl.dart';
import 'package:motosapp/src/features/maintenance/domain/datasource/maintenance_type_datasource.dart';
import 'package:motosapp/src/features/maintenance/domain/entities/maintenance_type_entity.dart';
import 'package:motosapp/src/features/maintenance/domain/repositories/maintenance_type_repository.dart';
import 'package:motosapp/src/shared/errors/exceptions.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import 'maintenance_type_repository_test.mocks.dart';

@GenerateMocks([MaintenanceTypeDataSource])
void main() {
  late MaintenanceTypeRepository maintenanceTypeRepositoryImpl;
  late MaintenanceTypeDataSource mockMaintenanceTypeDataSource;
  const List<MaintenanceTypeEntity> listmaintenanceTypeEntity = [];
  const id = 'id';
  const maintenanceType = MaintenanceTypeEntity(
    name: 'Cambio de aceite',
    periodicityCant: 6,
    periodicityTerm: 'Semanas',
    advanceNotificationCant: 1,
    advanceNotificationTerm: 'Semana',
  );
  setUp(() {
    mockMaintenanceTypeDataSource = MockMaintenanceTypeDataSource();
    maintenanceTypeRepositoryImpl = MaintenanceTypeRepositoryImpl(
      maintenanceTypeDataSource: mockMaintenanceTypeDataSource,
    );
  });
  group('Obtener listado de tipos de mantenimiento', () {
    test('Debería retornar datos cuando el llamado sea exitoso ', () async {
      // arrange
      when(mockMaintenanceTypeDataSource.getListMaintenanceType())
          .thenAnswer((_) async => listmaintenanceTypeEntity);
      // act
      final result =
          await maintenanceTypeRepositoryImpl.getListMaintenanceType();
      // assert
      expect(result, equals(const Right(listmaintenanceTypeEntity)));
    });
    test('Debería retornar un ServerFailure cuando el llamado sea fallido ',
        () async {
      // arrange
      when(mockMaintenanceTypeDataSource.getListMaintenanceType())
          .thenThrow(ServerException());
      // act
      final result =
          await maintenanceTypeRepositoryImpl.getListMaintenanceType();
      // assert
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group('Guardar tipo de mantenimiento', () {
    test('Debería agregar el nuevo registro ', () async {
      // arrange
      when(mockMaintenanceTypeDataSource.saveMaintenanceType(maintenanceType))
          .thenAnswer((_) async => const Right(null));
      // act
      final result = await maintenanceTypeRepositoryImpl
          .saveMaintenanceType(maintenanceType);
      // assert
      expect(result, equals(const Right(null)));
      verify(
          mockMaintenanceTypeDataSource.saveMaintenanceType(maintenanceType));
    });
    test(
        'Debería retornar un ServerFailure cuando falle al guardar el registro',
        () async {
      // arrange
      when(mockMaintenanceTypeDataSource.saveMaintenanceType(maintenanceType))
          .thenThrow(ServerException());
      // act
      final result = await maintenanceTypeRepositoryImpl
          .saveMaintenanceType(maintenanceType);
      // assert
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group('Obtener un tipo de mantenimiento', () {
    test('Debería retornar una moto cuando el llamado sea exitoso ', () async {
      // arrange
      when(mockMaintenanceTypeDataSource.getMaintenanceType(id))
          .thenAnswer((_) async => maintenanceType);
      // act
      final result = await maintenanceTypeRepositoryImpl.getMaintenanceType(id);
      // assert
      expect(result, equals(const Right(maintenanceType)));
    });
    test('Debería retornar un ServerFailure cuando el llamado sea fallido ',
        () async {
      // arrange
      when(mockMaintenanceTypeDataSource.getMaintenanceType(id))
          .thenThrow(ServerException());
      // act
      final result = await maintenanceTypeRepositoryImpl.getMaintenanceType(id);
      // assert
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
