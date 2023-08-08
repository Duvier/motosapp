import '../../../../shared/usescases/usecase.dart';
import '../models/motorcycle_model.dart';

abstract class DataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<MotorcycleModel>> getListMotorcycles();
  Future<MotorcycleModel> getMotorcycle(String id);
  Future<void> saveMotorcycle(ParamsMotorcycle params);
  Future<void> deleteMotorcycle(String id);
}