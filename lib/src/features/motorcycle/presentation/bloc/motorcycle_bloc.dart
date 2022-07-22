import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/usescases/usecase.dart';
import '../../data/models/motorcycle_model.dart';
import '../../domain/entities/motorcycle_entity.dart';
import '../../domain/usecases/delete_motorcycle_use_case.dart';
import '../../domain/usecases/get_list_motorcycle_use_case.dart';
import '../../domain/usecases/save_motorcycle_use_case.dart';

part 'motorcycle_event.dart';
part 'motorcycle_state.dart';

class MotorcycleBloc extends Bloc<MotorcycleEvent, MotorcycleState> {
  final GetListMotorcyclesUseCase getListMotorcyclesUseCase;
  final SaveMotorcycleUseCase saveMotorcyclesUseCase;
  final DeleteMotorcycleUseCase deleteMotorcycleUseCase;
  MotorcycleBloc({
    required this.getListMotorcyclesUseCase,
    required this.saveMotorcyclesUseCase,
    required this.deleteMotorcycleUseCase,
  }) : super(MotorcycleEmpty()) {
    on<GetListMotorcyclesEvent>(
        (event, emit) => _getListMotorcycles(event, emit));
    on<SaveMotorcyclesEvent>((event, emit) => _saveMotorcycles(event, emit));
    on<DeleteMotorcycleEvent>((event, emit) => _deleteMotorcycles(event, emit));
  }

  _getListMotorcycles(
      GetListMotorcyclesEvent event, Emitter<MotorcycleState> emit) async {
    emit(MotorcycleLoading());
    final failureOrMotorcycles = await getListMotorcyclesUseCase(NoParams());
    failureOrMotorcycles.fold(
      (_) => emit(
          const MotorcycleError(message: 'Error al traer listado de motos')),
      (motorcycles) {
        // print('motorcycles en bloc');
        // print(motorcycles.first);
        emit(MotorcycleLoaded(motorcycles: motorcycles));
      },
    );
  }

  _saveMotorcycles(
      SaveMotorcyclesEvent event, Emitter<MotorcycleState> emit) async {
    emit(MotorcycleLoading());
    final failureOrMotorcycles = await saveMotorcyclesUseCase(event.params);
    failureOrMotorcycles.fold(
      (_) => emit(const MotorcycleError(message: 'Error al guardar moto')),
      (_) => emit(MotorcycleSaved()),
    );
  }

  _deleteMotorcycles(
      DeleteMotorcycleEvent event, Emitter<MotorcycleState> emit) async {
    emit(MotorcycleLoading());
    final failureOrMotorcycles = await deleteMotorcycleUseCase(event.id);
    failureOrMotorcycles.fold(
      (_) => emit(const MotorcycleError(message: 'Error al eliminar moto')),
      (_) => emit(MotorcycleDeleted()),
    );
  }
}
