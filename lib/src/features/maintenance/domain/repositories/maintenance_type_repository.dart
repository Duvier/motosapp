import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../entities/maintenance_type_entity.dart';

abstract class MaintenanceTypeRepository {
  Future<Either<Failure, List<MaintenanceTypeEntity>>> getListMaintenanceType();
  Future<Either<Failure, MaintenanceTypeEntity>> getMaintenanceType(String id);
  Future<Either<Failure, void>> saveMaintenanceType(MaintenanceTypeEntity params);
  Future<Either<Failure, void>> deleteMaintenanceType(String id);
}