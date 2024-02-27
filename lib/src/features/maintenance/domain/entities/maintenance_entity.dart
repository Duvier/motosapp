import 'package:equatable/equatable.dart';

import 'maintenance_type_entity.dart';

class MaintenanceEntity extends Equatable {
  final String date;
  final MaintenanceTypeEntity? maintenanceTypeEntity;
  final String description;
  // Mantenimiento o reparación
  final int cost;
  final List<String>? parts; // TODO: Puede ser un mapara para que cada parte tenga atributos como: marca...
  final String? notes;
  final List<String>? images; // TODO:  Más adelante de actualiza para el tipo de dato de S3
  final num mileage;
  final String idMotorcycle;

  const MaintenanceEntity({
    required this.date,
    this.maintenanceTypeEntity,
    required this.description,
    required this.cost,
    this.parts,
    this.notes,
    this.images,
    required this.mileage,
    required this.idMotorcycle,
  });

  @override
  List<Object?> get props => [
        date,
        maintenanceTypeEntity,
        description,
        cost,
        parts,
        notes,
        images,
        mileage,
        idMotorcycle,
      ];
}
