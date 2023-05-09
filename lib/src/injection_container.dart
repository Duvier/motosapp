import 'package:get_it/get_it.dart';

import 'features/motorcycle/data/repositories/motorcycle_repository_impl.dart';
import 'features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'features/motorcycle/data/datasources/aws_data_source.dart';
import 'features/motorcycle/domain/usecases/delete_motorcycle_use_case.dart';
import 'features/motorcycle/domain/usecases/get_list_motorcycle_use_case.dart';
import 'features/motorcycle/domain/usecases/get_motorcycle_use_case.dart';
import 'features/motorcycle/domain/usecases/save_motorcycle_use_case.dart';
import 'features/motorcycle/presentation/bloc/motorcycle_bloc.dart';
import 'features/motorcycle/presentation/bloc/motorcycle_detail_bloc.dart';

final service_cotainer = GetIt.instance;

Future<void> init() async {
  //! Features - Motorcycle
  // Bloc
  service_cotainer.registerFactory(
    () => MotorcycleBloc(
      saveMotorcyclesUseCase: service_cotainer(),
      getListMotorcyclesUseCase: service_cotainer(),
      deleteMotorcycleUseCase: service_cotainer(),
    ),
  );
  service_cotainer.registerFactory(
    () => MotorcycleDetailBloc(getMotorcycleUseCase: service_cotainer()),
  );
  // Use Cases
  service_cotainer.registerLazySingleton(() => GetMotorcycleUseCase(repository: service_cotainer()));
  service_cotainer.registerLazySingleton(() => GetListMotorcyclesUseCase(repository: service_cotainer()));
  service_cotainer.registerLazySingleton(() => SaveMotorcycleUseCase(repository: service_cotainer()));
  service_cotainer.registerLazySingleton(() => DeleteMotorcycleUseCase(repository: service_cotainer()));
  // Repository
  service_cotainer.registerLazySingleton<MotorcycleRepository>(
    () => MotorcycleRepositoryImpl(awsDataSource: service_cotainer())
  );
  // DataSource
  service_cotainer.registerLazySingleton<AWSDataSource>(() => AWSDataSourceImpl());
  //! Shared
}
