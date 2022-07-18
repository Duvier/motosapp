import 'package:equatable/equatable.dart';

class MotorcycleEntity extends Equatable {
  final String name;
  final String brand;
  final String model;
  final String image;
  final int cylinderCapacity;

  const MotorcycleEntity({
    required this.name,
    required this.brand,
    required this.model,
    required this.image,
    required this.cylinderCapacity,
  });

  @override
  List<Object?> get props => [name, brand, model, image, cylinderCapacity];
}
