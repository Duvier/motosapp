import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/maintenance_type_entity.dart';
import '../../domain/usecases/get_list_maintenance_type_use_case.dart';

part 'maintenance_type_event.dart';
part 'maintenance_type_state.dart';

class MaintenanceTypeBloc
    extends Bloc<MaintenanceTypeEvent, MaintenanceTypeState> {
  final GetListMaintenanceTypeUseCase getListMaintenanceTypeUseCase;

  MaintenanceTypeBloc({required this.getListMaintenanceTypeUseCase})
      : super(MaintenanceTypeEmpty()) {
    on<GetListMaintenanceTypeEvent>((event, emit) => _getListMaintenanceType(event, emit));
  }

  _getListMaintenanceType(
    GetListMaintenanceTypeEvent event,
    Emitter<MaintenanceTypeState> emit,
  ) async {
    emit(MaintenanceTypeLoading());
    final failureOrListMaintenanceType = await getListMaintenanceTypeUseCase();
    failureOrListMaintenanceType.fold(
      (_) => emit(
        const MaintenanceTypeError(
          message: 'Error al traer listado de tipos de mantenimiento',
        ),
      ),
      (listMaintenanceType) {
        if (listMaintenanceType.isNotEmpty) {
          return emit(
            MaintenanceTypeLoaded(listMaintenanceType: listMaintenanceType),
          );
        }
        return emit(MaintenanceTypeEmpty());
      },
    );
  }
}
