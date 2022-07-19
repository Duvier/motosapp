import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../repositories/motorcycle_repository.dart';

class SaveMotorcycleUseCase extends UseCase<void, ParamsMotorcycle> {
  final MotorcycleRepository repository;
  SaveMotorcycleUseCase({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(ParamsMotorcycle params) {
    return repository.saveMotorcycle(params);
  }
}