import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/get_motorcycle_use_case.dart';
import 'package:motosapp/src/shared/errors/failures.dart';

import 'get_motorcycle_use_case_test.mocks.dart';

@GenerateMocks([MotorcycleRepository])
void main() {
  late GetMotorcycleUseCase usecase;
  late MotorcycleRepository mockRepository;
  const id = 'id';
  const entity = MotorcycleEntity(
    id: 'id',
    name: 'La morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  setUp(() {
    mockRepository = MockMotorcycleRepository();
    usecase = GetMotorcycleUseCase(repository: mockRepository);
  });

  test('Debería retornar un MotorcycleEntity cuando la solicitud sea correcta', () async {
    // arrange
    when(mockRepository.getMotorcycle(id)).thenAnswer((_) async => const Right(entity));
    // act
    final result = await usecase(id);
    // assert
    expect(result, const Right(entity));
    verify(mockRepository.getMotorcycle(id));
  });
  
  test('Debería retornar un ServerFailure cuando falle la solicitud', () async {
    // arrange
    when(mockRepository.getMotorcycle(id)).thenAnswer((_) async => Left(ServerFailure()));
    // act
    final result = await usecase(id);
    // assert
    expect(result, Left(ServerFailure()));
    verify(mockRepository.getMotorcycle(id));
  });
}
