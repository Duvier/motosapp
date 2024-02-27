import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../entities/maintenance_type_entity.dart';
import '../repositories/maintenance_type_repository.dart';


class GetMaintenanceTypeUseCase extends UseCase<MaintenanceTypeEntity, String> {
  final MaintenanceTypeRepository repository;
  GetMaintenanceTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, MaintenanceTypeEntity>> call(String params) {
    return repository.getMaintenanceType(params);
  }
  
}