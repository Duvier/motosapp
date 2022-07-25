import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/get_motorcycle_use_case.dart';
import 'package:motosapp/src/features/motorcycle/presentation/bloc/motorcycle_detail_bloc.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import 'motorcycle_detail_bloc_test.mocks.dart';

@GenerateMocks([GetMotorcycleUseCase])
void main() {
  late MotorcycleDetailBloc bloc;
  late GetMotorcycleUseCase mockGetMotorcycleUseCase;
  const entity = MotorcycleEntity(
    id: 'id',
    name: 'La Morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  const id = 'id';
  setUp(() {
    mockGetMotorcycleUseCase = MockGetMotorcycleUseCase();
    bloc = MotorcycleDetailBloc(getMotorcycleUseCase: mockGetMotorcycleUseCase);
  });
  tearDown(() {
    bloc.close();
  });
  test('El primer estado debería ser MotorcycleEmpty', () {
    // arrange
    // act
    // assert
    expect(bloc.state, MotorcycleDetailEmpty());
  });

  test(
      'Debería emitir MotorcycleDetailLoading y MotorcycleDetailLoaded si el caso de uso es correcto',
      () {
    // arrange
    when(mockGetMotorcycleUseCase(id))
        .thenAnswer((_) async => const Right(entity));
    final expect = [
      MotorcycleDetailLoading(),
      const MotorcycleDetailLoaded(motorcycle: entity),
    ];
    // assert later
    expectLater(bloc.stream, emitsInOrder(expect));
    // act
    bloc.add(const GetMotorcycleDetailEvent(id: id));
  });

  test(
      'Debería emitir MotorcycleDetailLoading y MotorcycleDetailError si el caso de uso es incorrecto',
      () {
    // arrange
    when(mockGetMotorcycleUseCase(id))
        .thenAnswer((_) async => Left(ServerFailure()));
    final expect = [
      MotorcycleDetailLoading(),
      const MotorcycleDetailError(message: 'Error al consultar moto'),
    ];
    // assert later
    expectLater(bloc.stream, emitsInOrder(expect));
    // act
    bloc.add(const GetMotorcycleDetailEvent(id: id));
  });
}
