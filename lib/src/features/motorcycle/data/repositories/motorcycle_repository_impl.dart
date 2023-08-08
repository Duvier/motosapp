import 'package:dartz/dartz.dart';

import '../../../../shared/errors/exceptions.dart';
import '../../../../shared/errors/failures.dart';
import '../../../../shared/usescases/usecase.dart';
import '../../domain/repositories/motorcycle_repository.dart';
import '../datasources/datasource.dart';
import '../models/motorcycle_model.dart';

class MotorcycleRepositoryImpl implements MotorcycleRepository {
  final DataSource dataSource;
  MotorcycleRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<MotorcycleModel>>> getListMotorcycles() async {
    try {
      final motorcycles = await dataSource.getListMotorcycles();
      return Right(motorcycles);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveMotorcycle(ParamsMotorcycle params) async {
    try {
      await dataSource.saveMotorcycle(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteMotorcycle(String id) async {
    try {
      await dataSource.deleteMotorcycle(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, MotorcycleModel>> getMotorcycle(String id) async {
    try {
      final motorcycle = await dataSource.getMotorcycle(id);
      return Right(motorcycle);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
}