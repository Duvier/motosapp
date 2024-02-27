import 'package:dartz/dartz.dart';
import 'package:motosapp/src/features/maintenance/domain/repositories/maintenance_type_repository.dart';
import 'package:motosapp/src/shared/errors/failures.dart';
import 'package:motosapp/src/shared/usescases/usecase.dart';

class DeleteMaintenanceTypeUseCase extends UseCase<void, String> {
  final MaintenanceTypeRepository repository;
  DeleteMaintenanceTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String params) {
    return repository.deleteMaintenanceType(params);
  }
}
