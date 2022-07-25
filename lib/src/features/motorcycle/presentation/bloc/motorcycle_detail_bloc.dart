import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/get_motorcycle_use_case.dart';

import '../../domain/entities/motorcycle_entity.dart';

part 'motorcycle_detail_event.dart';
part 'motorcycle_detail_state.dart';

class MotorcycleDetailBloc
    extends Bloc<MotorcycleDetailEvent, MotorcycleDetailState> {
  final GetMotorcycleUseCase getMotorcycleUseCase;
  MotorcycleDetailBloc({required this.getMotorcycleUseCase})
      : super(MotorcycleDetailEmpty()) {
    on<GetMotorcycleDetailEvent>((event, emit) => _getMotorcycle(event, emit));
  }

  _getMotorcycle(
    GetMotorcycleDetailEvent event,
    Emitter<MotorcycleDetailState> emit,
  ) async {
    emit(MotorcycleDetailLoading());
    final failureOrMotorcycle = await getMotorcycleUseCase(event.id);
    failureOrMotorcycle.fold(
      (_) => emit(
        const MotorcycleDetailError(message: 'Error al consultar moto'),
      ),
      (motorcycle) => emit(MotorcycleDetailLoaded(motorcycle: motorcycle)),
    );
  }
}
