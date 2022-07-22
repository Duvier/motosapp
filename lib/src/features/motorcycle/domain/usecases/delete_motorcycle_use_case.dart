import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../repositories/motorcycle_repository.dart';

class DeleteMotorcycleUseCase extends UseCase<void, String> {
  final MotorcycleRepository repository;

  DeleteMotorcycleUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(String params) {
    return repository.deleteMotorcycle(params);
  }
  
}