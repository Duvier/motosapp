import 'package:dartz/dartz.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import '../../../../shared/usescases/usecase.dart';
import '../entities/motorcycle_entity.dart';
import '../repositories/motorcycle_repository.dart';

class GetListMotorcyclesUseCase extends UseCase<List<MotorcycleEntity>, NoParams>{
  final MotorcycleRepository repository;
  GetListMotorcyclesUseCase({required this.repository});

  @override
  Future<Either<Failure,List<MotorcycleEntity>>> call(NoParams params) async {
    final modelRepo = await repository.getListMotorcycles();
    return modelRepo;
  }
}