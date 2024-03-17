import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/maintenance/domain/entities/maintenance_type_entity.dart';
import 'package:motosapp/src/features/maintenance/domain/usecases/get_list_maintenance_type_use_case.dart';
import 'package:motosapp/src/features/maintenance/presentation/bloc/maintenance_type_bloc.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import 'maintenance_type_bloc_test.mocks.dart';

@GenerateMocks([GetListMaintenanceTypeUseCase])
void main() {
  late GetListMaintenanceTypeUseCase mockGetListMaintenanceTypeUseCase;
  late MaintenanceTypeBloc bloc;
  const maintenanceTypeEntity = MaintenanceTypeEntity(
    name: 'SOAT',
    periodicityCant: 1,
    periodicityTerm: 'YEAR',
    advanceNotificationCant: 1,
    advanceNotificationTerm: 'WEEK',
  );
  const List<MaintenanceTypeEntity> listMaintenanceType = [maintenanceTypeEntity];

  setUp(() {
    mockGetListMaintenanceTypeUseCase = MockGetListMaintenanceTypeUseCase();
    bloc = MaintenanceTypeBloc(
      getListMaintenanceTypeUseCase: mockGetListMaintenanceTypeUseCase,
    );
  });
  tearDown(() => bloc.close());

  test('El primer estado debería ser MaintenanceTypeEmpty', () {
    // arrange
    // act
    // assert
    expect(bloc.state, MaintenanceTypeEmpty());
  });

  group('Traer listado de tipos de mantenimiento', () {
    test('Debería retornar datos del caso de uso GetListMaintenanceTypeUseCase',
        () {
      // arrange
      when(mockGetListMaintenanceTypeUseCase()).thenAnswer(
        (_) async => const Right(listMaintenanceType),
      );
      final expect = [
        MaintenanceTypeLoading(),
        const MaintenanceTypeLoaded(listMaintenanceType: listMaintenanceType),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(GetListMaintenanceTypeEvent());
    });

    test('Debería emitir Cargando y Empty cuando el llamado retorne una lista vacía', () {
      // arrange
      when(mockGetListMaintenanceTypeUseCase())
          .thenAnswer((_) async => const Right([]));
      final expect = [
        MaintenanceTypeLoading(),
        MaintenanceTypeEmpty(),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(GetListMaintenanceTypeEvent());
    });
    test('Debería emitir Cargando y Error cuando el llamado falle', () {
      // arrange
      when(mockGetListMaintenanceTypeUseCase())
          .thenAnswer((_) async => Left(ServerFailure()));
      final expect = [
        MaintenanceTypeLoading(),
        const MaintenanceTypeError(
            message: 'Error al traer listado de tipos de mantenimiento'),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(GetListMaintenanceTypeEvent());
    });
  });
}
