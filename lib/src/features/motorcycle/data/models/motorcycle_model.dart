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
  factory MotorcycleModel.fromFirebase(Map<String, dynamic> json, String id) {
    return MotorcycleModel(
      id: id,
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      image: json['image'],
      cylinderCapacity: json['cylinderCapacity'],
    );
  }

  static List<MotorcycleModel> fromListFirebase(List<dynamic> listJson) {
    List<MotorcycleModel> motorcycles = [];
    for (final json in listJson) {
      motorcycles.add(MotorcycleModel.fromFirebase(json.data(), json.id));
    }
    return motorcycles;
  }
  
  static List<MotorcycleModel> fromListJson(List<dynamic> listJson) {
    List<MotorcycleModel> motorcycles = [];
    for (var json in listJson) {
      motorcycles.add(MotorcycleModel.fromJson(json));
    }
    return motorcycles;
  }
}
