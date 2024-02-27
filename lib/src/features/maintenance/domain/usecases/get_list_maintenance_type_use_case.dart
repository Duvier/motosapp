import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../entities/maintenance_type_entity.dart';
import '../repositories/maintenance_type_repository.dart';


class GetListMaintenanceTypeUseCase extends UseCase<List<MaintenanceTypeEntity>, void> {
  final MaintenanceTypeRepository repository;
  GetListMaintenanceTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MaintenanceTypeEntity>>> call([params]) {
    return repository.getListMaintenanceType();
  }
  
}