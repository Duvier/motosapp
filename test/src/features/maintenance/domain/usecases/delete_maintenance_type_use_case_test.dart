import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/maintenance/domain/repositories/maintenance_type_repository.dart';
import 'package:motosapp/src/features/maintenance/domain/usecases/delete_maintenance_type_use_case.dart';

import 'save_maintenance_use_case_test.mocks.dart';

void main() {
  late DeleteMaintenanceTypeUseCase useCase;
  late MaintenanceTypeRepository mockRepository;
  const String id = 'ID';
  setUp(() {
    mockRepository = MockMaintenanceTypeRepository();
    useCase = DeleteMaintenanceTypeUseCase(repository: mockRepository);
  });

  test('Debería obtener 200 como código de respuesta', () async {
    // arrange
    when(mockRepository.deleteMaintenanceType(id))
        .thenAnswer((_) async => const Right(null));
    // act
    await useCase(id);
    // assert
    verify(mockRepository.deleteMaintenanceType(id));
  });
}
