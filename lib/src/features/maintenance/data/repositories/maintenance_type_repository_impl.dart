import 'package:dartz/dartz.dart';

import '../../../../shared/errors/exceptions.dart';
import '../../../../shared/errors/failures.dart';
import '../../domain/datasource/maintenance_type_datasource.dart';
import '../../domain/entities/maintenance_type_entity.dart';
import '../../domain/repositories/maintenance_type_repository.dart';

class MaintenanceTypeRepositoryImpl implements MaintenanceTypeRepository {
  @override
  final MaintenanceTypeDataSource maintenanceTypeDataSource;

  MaintenanceTypeRepositoryImpl({required this.maintenanceTypeDataSource});

  @override
  Future<Either<Failure, List<MaintenanceTypeEntity>>>
      getListMaintenanceType() async {
    try {
      final listMaintenanceTye =
          await maintenanceTypeDataSource.getListMaintenanceType();
      return Right(listMaintenanceTye);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteMaintenanceType(String id) async {
    try {
      await maintenanceTypeDataSource.getListMaintenanceType();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MaintenanceTypeEntity>> getMaintenanceType(
      String id) async {
    try {
      final maintenanceType =
          await maintenanceTypeDataSource.getMaintenanceType(id);
      return Right(maintenanceType);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveMaintenanceType(
    MaintenanceTypeEntity maintenanceTypeEntity,
  ) async {
    try {
      await maintenanceTypeDataSource.saveMaintenanceType(
        maintenanceTypeEntity,
      );
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
