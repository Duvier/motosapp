import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/delete_motorcycle_use_case.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/get_list_motorcycle_use_case.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/save_motorcycle_use_case.dart';
import 'package:motosapp/src/features/motorcycle/presentation/bloc/motorcycle_bloc.dart';
import 'package:motosapp/src/shared/errors/failures.dart';
import 'package:motosapp/src/shared/usescases/usecase.dart';

import 'motorcycle_bloc_test.mocks.dart';

@GenerateMocks([
  GetListMotorcyclesUseCase,
  SaveMotorcycleUseCase,
  DeleteMotorcycleUseCase,
])
void main() {
  late GetListMotorcyclesUseCase mockGetListUseCase;
  late SaveMotorcycleUseCase mockSaveUseCase;
  late DeleteMotorcycleUseCase mockDeleteUseCase;
  late MotorcycleBloc bloc;
  const List<MotorcycleEntity> listMotorcycles = [
    MotorcycleEntity(
      id: 'id',
      name: 'name',
      brand: 'brand',
      model: 'model',
      image: 'image',
      cylinderCapacity: 250,
    ),
  ];
  const id = 'id';
  const params = ParamsMotorcycle(
    name: 'La Morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  setUp(() {
    mockGetListUseCase = MockGetListMotorcyclesUseCase();
    mockSaveUseCase = MockSaveMotorcycleUseCase();
    mockDeleteUseCase = MockDeleteMotorcycleUseCase();
    bloc = MotorcycleBloc(
      getListMotorcyclesUseCase: mockGetListUseCase,
      saveMotorcyclesUseCase: mockSaveUseCase,
      deleteMotorcycleUseCase: mockDeleteUseCase,
    );
  });
  tearDown(() {
    bloc.close();
  });
  test('El primer estado debería ser MotorcycleEmpty', () {
    // arrange
    // act
    // assert
    expect(bloc.state, MotorcycleEmpty());
  });

  group('Traer listado de motos', () {
    test('Debería retornar datos del caso de uso GetListMotorcyclesUseCase',
        () {
      // arrange
      when(mockGetListUseCase(NoParams())).thenAnswer(
        (_) async => const Right(listMotorcycles),
      );
      final expect = [
        MotorcycleLoading(),
        const MotorcycleLoaded(motorcycles: listMotorcycles),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(GetListMotorcyclesEvent());
    });

    test('Debería emitir Cargando y Error cuando el llamado falle', () {
      // arrange
      when(mockGetListUseCase(NoParams()))
          .thenAnswer((_) async => Left(ServerFailure()));
      final expect = [
        MotorcycleLoading(),
        const MotorcycleError(message: 'Error al traer listado de motos'),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(GetListMotorcyclesEvent());
    });
  });

  group('Guardar moto', () {
    test('Debería emitir Cargando y Error cuando falle la acción de guardar',
        () {
      // arrange
      when(mockSaveUseCase(params))
          .thenAnswer((_) async => Left(ServerFailure()));
      final expect = [
        MotorcycleLoading(),
        const MotorcycleError(message: 'Error al guardar moto'),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(const SaveMotorcyclesEvent(params));
    });
    test(
        'Debería emitir Cargando y Saved cuando guarde correctamente la nueva moto',
        () {
      // arrange
      when(mockSaveUseCase(params)).thenAnswer((_) async => const Right(null));
      final expect = [
        MotorcycleLoading(),
        MotorcycleSaved(),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(const SaveMotorcyclesEvent(params));
    });
  });

  group('Eliminar moto', () {
    test('Debería emitir Cargando y Error cuando falle la acción de eliminar',
        () {
      // arrange
      when(mockDeleteUseCase(id))
          .thenAnswer((_) async => Left(ServerFailure()));
      final expect = [
        MotorcycleLoading(),
        const MotorcycleError(message: 'Error al eliminar moto'),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(const DeleteMotorcycleEvent(id));
    });
    test(
        'Debería emitir Cargando y Deleted cuando elimine correctamente la moto',
        () {
      // arrange
      when(mockDeleteUseCase(id)).thenAnswer((_) async => const Right(null));
      final expect = [
        MotorcycleLoading(),
        MotorcycleDeleted(),
      ];
      // assert later
      expectLater(bloc.stream, emitsInOrder(expect));
      // act
      bloc.add(const DeleteMotorcycleEvent(id));
    });
  });
}
