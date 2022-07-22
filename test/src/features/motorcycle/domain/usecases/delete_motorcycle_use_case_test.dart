import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/models/Motorcycle.dart';
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/delete_motorcycle_use_case.dart';

import 'delete_motorcycle_use_case_test.mocks.dart';

@GenerateMocks([MotorcycleRepository])
void main() {
  late DeleteMotorcycleUseCase usecase;
  late MotorcycleRepository mockRepository;
  final motorcycle = Motorcycle(
    id: 'id',
    name: 'La morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  setUp(() {
    mockRepository = MockMotorcycleRepository();
    usecase = DeleteMotorcycleUseCase(repository: mockRepository);
  });

  test('Debería eliminar el registro', () async {
    // arrange
    when(mockRepository.deleteMotorcycle(motorcycle)).thenAnswer((_) async => const Right(null));
    // act
    await usecase(motorcycle);
    // assert
    verify(mockRepository.deleteMotorcycle(motorcycle));
  });
}
