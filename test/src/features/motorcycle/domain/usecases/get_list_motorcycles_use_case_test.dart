import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/get_list_motorcycle_use_case.dart';
import 'package:motosapp/src/shared/utils/no_params.dart';

import 'get_list_motorcycles_use_case_test.mocks.dart';

@GenerateMocks([MotorcycleRepository])
void main() {
  late GetListMotorcyclesUseCase usecase;
  late MotorcycleRepository mockRepository;
  final List<MotorcycleEntity> tListMotorcycleEntity = [];
  setUp(() {
    mockRepository = MockMotorcycleRepository();
    usecase = GetListMotorcyclesUseCase(repository: mockRepository);
  });

  test('Debería retornar una lista de MotorcycleEntity', () async {
    // arrange
    when(mockRepository.getListMotorcycles()).thenAnswer((_) async => Right(tListMotorcycleEntity));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, Right(tListMotorcycleEntity));
    verify(mockRepository.getListMotorcycles());
  });
}
