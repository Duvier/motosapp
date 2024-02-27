import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures.dart';
import '../entities/motorcycle_entity.dart';
import '../usecases/params_motorcycle.dart';

abstract class MotorcycleRepository {
  Future<Either<Failure, List<MotorcycleEntity>>> getListMotorcycles();
  Future<Either<Failure, MotorcycleEntity>> getMotorcycle(String id);
  Future<Either<Failure, void>> saveMotorcycle(ParamsMotorcycle params);
  Future<Either<Failure, void>> deleteMotorcycle(String id);
}