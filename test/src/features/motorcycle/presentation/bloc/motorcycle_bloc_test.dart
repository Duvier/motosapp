import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/get_list_motorcycle_use_case.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/save_motorcycle_use_case.dart';
import 'package:motosapp/src/features/motorcycle/presentation/bloc/motorcycle_bloc.dart';
import 'package:motosapp/src/shared/errors/failures.dart';
import 'package:motosapp/src/shared/usescases/usecase.dart';

import 'motorcycle_bloc_test.mocks.dart';

@GenerateMocks([GetListMotorcyclesUseCase, SaveMotorcycleUseCase])
void main(){
  late GetListMotorcyclesUseCase mockGetListUseCase;
  late SaveMotorcycleUseCase mockSaveUseCase;
  late MotorcycleBloc bloc;
  const List<MotorcycleEntity> listMotorcycles = [];
  setUp((){
    mockGetListUseCase = MockGetListMotorcyclesUseCase();
    mockSaveUseCase = MockSaveMotorcycleUseCase();
    bloc = MotorcycleBloc(getListMotorcyclesUseCase: mockGetListUseCase, saveMotorcyclesUseCase: mockSaveUseCase);
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
  test('Debería retornar datos del caso de uso GetListMotorcyclesUseCase', () {
    // arrange
    when(mockGetListUseCase(NoParams())).thenAnswer((_) async => const Right(listMotorcycles));
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
    when(mockGetListUseCase(NoParams())).thenAnswer((_) async => Left(ServerFailure()) );
    final expect = [
      MotorcycleLoading(),
      const MotorcycleError(message: 'Failed getting data'),
    ];
    // assert later
    expectLater(bloc.stream, emitsInOrder(expect));
    // act
    bloc.add(GetListMotorcyclesEvent());
  });
}