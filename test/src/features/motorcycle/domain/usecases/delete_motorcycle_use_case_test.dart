import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/delete_motorcycle_use_case.dart';

import 'delete_motorcycle_use_case_test.mocks.dart';

@GenerateMocks([MotorcycleRepository])
void main() {
  late DeleteMotorcycleUseCase usecase;
  late MotorcycleRepository mockRepository;
  const id = 'id';
  setUp(() {
    mockRepository = MockMotorcycleRepository();
    usecase = DeleteMotorcycleUseCase(repository: mockRepository);
  });

  test('Debería eliminar el registro', () async {
    // arrange
    when(mockRepository.deleteMotorcycle(id)).thenAnswer((_) async => const Right(null));
    // act
    await usecase(id);
    // assert
    verify(mockRepository.deleteMotorcycle(id));
  });
}
