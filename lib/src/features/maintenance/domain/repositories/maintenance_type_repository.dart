import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../datasource/maintenance_type_datasource.dart';
import '../entities/maintenance_type_entity.dart';

abstract class MaintenanceTypeRepository {
  final MaintenanceTypeDataSource maintenanceTypeDataSource;
  const MaintenanceTypeRepository({required this.maintenanceTypeDataSource});
  Future<Either<Failure, List<MaintenanceTypeEntity>>> getListMaintenanceType();
  Future<Either<Failure, MaintenanceTypeEntity>> getMaintenanceType(String id);
  Future<Either<Failure, void>> saveMaintenanceType(
    MaintenanceTypeEntity maintenanceTypeEntity,
  );
  Future<Either<Failure, void>> deleteMaintenanceType(String id);
}
