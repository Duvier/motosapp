import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../shared/errors/exceptions.dart';
import '../../../../shared/usescases/usecase.dart';
import '../models/motorcycle_model.dart';
import 'datasource.dart';

class FirebaseDataSourceImpl implements DataSource {
  final db = FirebaseFirestore.instance;
  static const collection = 'motos';

  @override
  Future<List<MotorcycleModel>> getListMotorcycles() async {
    try {
      List<MotorcycleModel> models = [];
      await db.collection(collection).get().then((event) {
        models = MotorcycleModel.fromListFirebase(event.docs);
      });
      return models;
    } catch (e) {
      debugPrint('Error en DataSource $e');
      throw ServerException();
    }
  }

  @override
  Future<void> saveMotorcycle(ParamsMotorcycle params) async {
    try {
      final motorcycle = {
        'name': params.name,
        'brand': params.brand,
        'model': params.model,
        'image': params.image,
        'cylinderCapacity': params.cylinderCapacity,
      };
      await db.collection(collection).add(motorcycle);
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }

  @override
  Future<void> deleteMotorcycle(String id) async {
    try {
      // final List<Motorcycle> motorcycleToDelete = await amplify.query<Motorcycle>(Motorcycle.classType, where: Motorcycle.ID.eq(id));
      // amplify.delete(motorcycleToDelete.first);
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }

  @override
  Future<MotorcycleModel> getMotorcycle(String id) async {
    try {
      return MotorcycleModel(
        id: id,
        name: 'name',
        brand: 'brand',
        model: 'model',
        image: '',
        cylinderCapacity: 125,
      );
      // final motorcycle = await amplify.query<Motorcycle>(Motorcycle.classType, where: Motorcycle.ID.eq(id));
      // return MotorcycleModel.fromModelAmplify(motorcycle.first);
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }
}
