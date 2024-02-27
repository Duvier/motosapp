import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/src/features/maintenance/domain/entities/maintenance_type_entity.dart';
import 'package:motosapp/src/features/maintenance/domain/repositories/maintenance_type_repository.dart';
import 'package:motosapp/src/features/maintenance/domain/usecases/get_list_maintenance_type_use_case.dart';
import 'package:motosapp/src/shared/utils/no_params.dart';

import 'save_maintenance_use_case_test.mocks.dart';

@GenerateMocks([MaintenanceTypeRepository])
void main() {
  late MaintenanceTypeRepository mockRepository;
  late GetListMaintenanceTypeUseCase useCase;
  const result = [
    MaintenanceTypeEntity(
      name: 'SOAT',
      periodicityCant: 1,
      periodicityTerm: 'YEAR',
      advanceNotificationCant: 1,
      advanceNotificationTerm: 'WEEK',
    )
  ];
  setUp(() {
    mockRepository = MockMaintenanceTypeRepository();
    useCase = GetListMaintenanceTypeUseCase(repository: mockRepository);
  });

  test('Debería obtener un listado de MaintenanceTypeEntity', () async {
    // arrange
    when(mockRepository.getListMaintenanceType())
        .thenAnswer((_) async => const Right(result));
    // act
    await useCase(NoParams());
    // assert
    verify(mockRepository.getListMaintenanceType());
  });
}
