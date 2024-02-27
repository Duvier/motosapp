import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/maintenance/domain/entities/maintenance_type_entity.dart';
import 'package:motosapp/src/features/maintenance/domain/repositories/maintenance_type_repository.dart';
import 'package:motosapp/src/features/maintenance/domain/usecases/get_maintenance_type_use_case.dart';

import 'save_maintenance_use_case_test.mocks.dart';

@GenerateMocks([MaintenanceTypeRepository])
void main() {
  late MaintenanceTypeRepository mockRepository;
  late GetMaintenanceTypeUseCase useCase;
  const id = 'ID';
  const result = MaintenanceTypeEntity(
      name: 'SOAT',
      periodicityCant: 1,
      periodicityTerm: 'YEAR',
      advanceNotificationCant: 1,
      advanceNotificationTerm: 'WEEK',
    );
  setUp(() {
    mockRepository = MockMaintenanceTypeRepository();
    useCase = GetMaintenanceTypeUseCase(repository: mockRepository);
  });

  test('Debería obtener MaintenanceTypeEntity', () async {
    // arrange
    when(mockRepository.getMaintenanceType(id))
        .thenAnswer((_) async => const Right(result));
    // act
    await useCase(id);
    // assert
    verify(mockRepository.getMaintenanceType(id));
  });
}
