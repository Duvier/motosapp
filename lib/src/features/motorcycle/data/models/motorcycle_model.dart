import '../../domain/entities/motorcycle_entity.dart';

class MotorcycleModel extends MotorcycleEntity {
  // final String id;
  const MotorcycleModel({
    required super.id,
    required super.name,
    required super.brand,
    required super.model,
    required super.image,
    required super.cylinderCapacity,
  });

  factory MotorcycleModel.fromJson(Map<String, dynamic> json) {
    return MotorcycleModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      image: json['image'],
      cylinderCapacity: json['cylinderCapacity'],
    );
  }

  static List<MotorcycleModel> formListJson(List<dynamic> listJson) {
    List<MotorcycleModel> motorcycles = [];
    for (var json in listJson) {
      motorcycles.add(MotorcycleModel.fromJson(json));
    }
    return motorcycles;
  }
}
