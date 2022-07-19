import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:motosapp/src/features/motorcycle/domain/usecases/save_motorcycle_use_case.dart';

import '../../../../shared/usescases/usecase.dart';
import '../../data/models/motorcycle_model.dart';
import '../../domain/entities/motorcycle_entity.dart';
import '../../domain/usecases/get_list_motorcycle_use_case.dart';

part 'motorcycle_event.dart';
part 'motorcycle_state.dart';

class MotorcycleBloc extends Bloc<MotorcycleEvent, MotorcycleState> {
  final GetListMotorcyclesUseCase getListMotorcyclesUseCase;
  final SaveMotorcycleUseCase saveMotorcyclesUseCase;
  MotorcycleBloc({
    required this.saveMotorcyclesUseCase,
    required this.getListMotorcyclesUseCase,
  }) : super(MotorcycleEmpty()) {
    on<GetListMotorcyclesEvent>(
        (event, emit) => _getListMotorcycles(event, emit));
    on<SaveMotorcyclesEvent>((event, emit) => _saveMotorcycles(event, emit));
  }

  _getListMotorcycles(
      GetListMotorcyclesEvent event, Emitter<MotorcycleState> emit) async {
    emit(MotorcycleLoading());
    final failureOrMotorcycles = await getListMotorcyclesUseCase(NoParams());
    failureOrMotorcycles.fold(
      (failure) => emit(const MotorcycleError(message: 'Error al traer listado de motos')),
      (motorcycles) => emit(MotorcycleLoaded(motorcycles: motorcycles)),
    );
  }

  _saveMotorcycles(SaveMotorcyclesEvent event, Emitter<MotorcycleState> emit) async {
    emit(MotorcycleLoading());
    final failureOrMotorcycles = await saveMotorcyclesUseCase(event.params);
    failureOrMotorcycles.fold(
      (failure) => emit(const MotorcycleError(message: 'Error al guardar moto')),
      (motorcycles) => emit(MotorcycleSaved()),
    );
  }
}
