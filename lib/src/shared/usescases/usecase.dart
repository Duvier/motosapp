import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class ParamsMotorcycle extends Equatable {
  final String name;
  final String brand;
  final String model;
  final String image;
  final int cylinderCapacity;

  const ParamsMotorcycle({
    required this.name,
    required this.brand,
    required this.model,
    required this.image,
    required this.cylinderCapacity,
  });

  @override
  List<Object?> get props => [name, brand, model, image, cylinderCapacity];
}