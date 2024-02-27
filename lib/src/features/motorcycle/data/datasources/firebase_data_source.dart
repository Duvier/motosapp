import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../shared/errors/exceptions.dart';
import '../../domain/usecases/params_motorcycle.dart';
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
      MotorcycleModel motorcycle;
      return await db.collection(collection).doc(id).get().then((value) {
        motorcycle = MotorcycleModel.fromFirebase(value.data()!, value.id);
        return motorcycle;
      }).catchError((e) {
        throw ServerException();
      });
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }
}
