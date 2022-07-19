import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../entities/motorcycle_entity.dart';

abstract class MotorcycleRepository {
  Future<Either<Failure, List<MotorcycleEntity>>> getListMotorcycles();
  Future<Either<Failure, void>> saveMotorcycle(ParamsMotorcycle params);
}