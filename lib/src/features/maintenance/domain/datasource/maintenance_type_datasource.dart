

import '../entities/maintenance_type_entity.dart';

abstract class MaintenanceTypeDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<MaintenanceTypeEntity>> getListMaintenanceType();
  Future<MaintenanceTypeEntity> getMaintenanceType(String id);
  Future<void> saveMaintenanceType(MaintenanceTypeEntity maintenanceTypeEntity);
  Future<void> deleteMaintenanceType(String id);
}
