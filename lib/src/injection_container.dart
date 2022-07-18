import 'package:get_it/get_it.dart';

import 'features/motorcycle/data/repositories/motorcycle_repository_impl.dart';
import 'features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'features/motorcycle/data/datasources/aws_data_source.dart';
import 'features/motorcycle/domain/usecases/get_list_motorcycle_use_case.dart';
import 'features/motorcycle/presentation/bloc/motorcycle_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async{
  //! Features - Motorcycle
  // Bloc
  sl.registerFactory(
    () => MotorcycleBloc(getListMotorcyclesUseCase: sl()),
  );
  // Use Cases
  sl.registerLazySingleton(() => GetListMotorcyclesUseCase(repository: sl()));
  // Repository
  sl.registerLazySingleton<MotorcycleRepository>(() => MotorcycleRepositoryImpl(awsDataSource: sl()));
  // DataSource
  sl.registerLazySingleton<AWSDataSource>(() => AWSDataSourceImpl());

  //! Shared

}
