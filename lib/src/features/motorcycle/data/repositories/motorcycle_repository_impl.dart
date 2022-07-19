import 'package:dartz/dartz.dart';

import '../../../../shared/errors/exceptions.dart';
import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../../domain/repositories/motorcycle_repository.dart';
import '../datasources/aws_data_source.dart';
import '../models/motorcycle_model.dart';

class MotorcycleRepositoryImpl implements MotorcycleRepository {
  final AWSDataSource awsDataSource;
  MotorcycleRepositoryImpl({required this.awsDataSource});

  @override
  Future<Either<Failure, List<MotorcycleModel>>> getListMotorcycles() async {
    try {
      final motorcycles = await awsDataSource.getListMotorcycles();
      return Right(motorcycles);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveMotorcycle(ParamsMotorcycle params) async {
    try {
      await awsDataSource.saveMotorcycle(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
  
}