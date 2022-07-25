import '../../../../../models/Motorcycle.dart';
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

  factory MotorcycleModel.fromModelAmplify(Motorcycle model) {
    return MotorcycleModel(
      id: model.id,
      name: model.name,
      brand: model.brand,
      model: model.model,
      image: model.image ?? 'default.jpg',
      cylinderCapacity: model.cylinderCapacity,
    );
  }

  static List<MotorcycleModel> formListAmplifyModels(List<dynamic> listJson) {
    List<MotorcycleModel> motorcycles = [];
    for (var json in listJson) {
      motorcycles.add(MotorcycleModel.fromModelAmplify(json));
    }
    return motorcycles;
  }

  static List<MotorcycleModel> formListJson(List<dynamic> listJson) {
    List<MotorcycleModel> motorcycles = [];
    for (var json in listJson) {
      motorcycles.add(MotorcycleModel.fromJson(json));
    }
    return motorcycles;
  }
}
