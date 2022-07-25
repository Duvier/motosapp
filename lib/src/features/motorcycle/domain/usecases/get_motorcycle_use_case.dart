
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../shared/usescases/usecase.dart';
import '../entities/motorcycle_entity.dart';

class GetMotorcycleUseCase extends UseCase<MotorcycleEntity, String> {
  final MotorcycleRepository repository;

  GetMotorcycleUseCase({required this.repository});
  @override
  Future<Either<Failure, MotorcycleEntity>> call(params) {
    return repository.getMotorcycle(params);
  }
  
}