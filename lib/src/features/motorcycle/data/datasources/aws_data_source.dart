import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/foundation.dart';
import 'package:motosapp/models/ModelProvider.dart';

import '../../../../shared/errors/exceptions.dart';
import '../../../../shared/usescases/usecase.dart';
import '../models/motorcycle_model.dart';

abstract class AWSDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<MotorcycleModel>> getListMotorcycles();
  Future<MotorcycleModel> getMotorcycle(String id);
  Future<void> saveMotorcycle(ParamsMotorcycle params);
  Future<void> deleteMotorcycle(String id);
}

class AWSDataSourceImpl implements AWSDataSource {
  final amplify = AmplifyDataStore(modelProvider: ModelProvider.instance);
  // final AmplifyDataStore amplify;
  // AWSDataSourceImpl({required this.amplify});

  @override
  Future<List<MotorcycleModel>> getListMotorcycles() async {
    try {
      final motorcycles = await amplify.query<Motorcycle>(Motorcycle.classType);
      final models = MotorcycleModel.formListAmplifyModels(motorcycles);
      return models;
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }

  @override
  Future<void> saveMotorcycle(ParamsMotorcycle params) async {
    try {
      final motorcycle = Motorcycle(
        name: params.name,
        brand: params.brand,
        model: params.model,
        image: params.image,
        cylinderCapacity: params.cylinderCapacity,
      );
      await amplify.save(motorcycle);
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }
  
  @override
  Future<void> deleteMotorcycle(String id) async {
    try {
      final List<Motorcycle> motorcycleToDelete = await amplify.query<Motorcycle>(Motorcycle.classType, where: Motorcycle.ID.eq(id));
      amplify.delete(motorcycleToDelete.first);
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }
  
  @override
  Future<MotorcycleModel> getMotorcycle(String id) async {
     try {
      final motorcycle = await amplify.query<Motorcycle>(Motorcycle.classType, where: Motorcycle.ID.eq(id));
      return MotorcycleModel.fromModelAmplify(motorcycle.first);
    } catch (e) {
      if (kDebugMode) print(e);
      throw ServerException();
    }
  }
}
