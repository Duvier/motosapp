import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/params_motorcycle.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/save_motorcycle_use_case.dart';

import 'save_motorcycle_use_case_test.mocks.dart';

@GenerateMocks([MotorcycleRepository])
void main() {
  late MotorcycleRepository mockRepository;
  late SaveMotorcycleUseCase usecase;
  const params = ParamsMotorcycle(
    name: 'La morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  setUp(() {
    mockRepository = MockMotorcycleRepository();
    usecase = SaveMotorcycleUseCase(repository: mockRepository);
  });

  test('Debería obtener 200 como código de respuesta', () async {
    // arrange
    when(mockRepository.saveMotorcycle(params))
    .thenAnswer((_) async => const Right(null));
    // act
    await usecase(params);
    // assert
    verify(mockRepository.saveMotorcycle(params));
  });
}
