import 'package:get_it/get_it.dart';

// import 'features/motorcycle/data/datasources/datasource.dart';
import 'features/motorcycle/data/repositories/motorcycle_repository_impl.dart';
import 'features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'features/motorcycle/domain/usecases/delete_motorcycle_use_case.dart';
import 'features/motorcycle/domain/usecases/get_list_motorcycle_use_case.dart';
import 'features/motorcycle/domain/usecases/get_motorcycle_use_case.dart';
import 'features/motorcycle/domain/usecases/save_motorcycle_use_case.dart';
import 'features/motorcycle/presentation/bloc/motorcycle_bloc.dart';
import 'features/motorcycle/presentation/bloc/motorcycle_detail_bloc.dart';

final serviceCotainer = GetIt.instance;

Future<void> init() async {
  //! Features - Motorcycle
  // Bloc
  serviceCotainer.registerFactory(
    () => MotorcycleBloc(
      saveMotorcyclesUseCase: serviceCotainer(),
      getListMotorcyclesUseCase: serviceCotainer(),
      deleteMotorcycleUseCase: serviceCotainer(),
    ),
  );
  serviceCotainer.registerFactory(
    () => MotorcycleDetailBloc(getMotorcycleUseCase: serviceCotainer()),
  );
  // Use Cases
  serviceCotainer.registerLazySingleton(() => GetMotorcycleUseCase(repository: serviceCotainer()));
  serviceCotainer.registerLazySingleton(() => GetListMotorcyclesUseCase(repository: serviceCotainer()));
  serviceCotainer.registerLazySingleton(() => SaveMotorcycleUseCase(repository: serviceCotainer()));
  serviceCotainer.registerLazySingleton(() => DeleteMotorcycleUseCase(repository: serviceCotainer()));
  // Repository
  serviceCotainer.registerLazySingleton<MotorcycleRepository>(
    () => MotorcycleRepositoryImpl(dataSource: serviceCotainer())
  );
  // DataSources
  // serviceCotainer.registerLazySingleton<DataSource>(() => AWSDataSourceImpl());
  //! Shared
}
