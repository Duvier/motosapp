import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../entities/maintenance_type_entity.dart';
import '../repositories/maintenance_type_repository.dart';

class SaveMaintenanceTypeUseCase extends UseCase<void, MaintenanceTypeEntity> {
  final MaintenanceTypeRepository repository;
  SaveMaintenanceTypeUseCase({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(MaintenanceTypeEntity params) {
    return repository.saveMaintenanceType(params);
  }
}