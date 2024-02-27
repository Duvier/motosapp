import 'package:dartz/dartz.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import '../../../../shared/usescases/usecase.dart';
import '../../../../shared/utils/no_params.dart';
import '../entities/motorcycle_entity.dart';
import '../repositories/motorcycle_repository.dart';

class GetListMotorcyclesUseCase extends UseCase<List<MotorcycleEntity>, NoParams>{
  final MotorcycleRepository repository;
  GetListMotorcyclesUseCase({required this.repository});

  @override
  Future<Either<Failure,List<MotorcycleEntity>>> call(NoParams params) async {
    return await repository.getListMotorcycles();    
  }
}