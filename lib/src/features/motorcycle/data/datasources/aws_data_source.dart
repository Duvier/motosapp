import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:motosapp/models/ModelProvider.dart';

import '../../../../shared/errors/exceptions.dart';
import '../models/motorcycle_model.dart';

abstract class AWSDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<MotorcycleModel>> getListMotorcycles();
}

class AWSDataSourceImpl implements AWSDataSource {
  final amplify = AmplifyDataStore(modelProvider: ModelProvider.instance);
  // final AmplifyDataStore amplify;
  // AWSDataSourceImpl({required this.amplify});

  @override
  Future<List<MotorcycleModel>> getListMotorcycles() async {
    try {
      final motos = await amplify.query<Motorcycle>(Motorcycle.classType);
      print('Motorcycles: $motos');
      return MotorcycleModel.formListJson(motos);
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
  
}
