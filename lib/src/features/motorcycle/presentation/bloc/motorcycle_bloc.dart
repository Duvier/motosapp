import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/usescases/usecase.dart';
import '../../domain/entities/motorcycle_entity.dart';
import '../../domain/usecases/get_list_motorcycle_use_case.dart';

part 'motorcycle_event.dart';
part 'motorcycle_state.dart';

class MotorcycleBloc extends Bloc<MotorcycleEvent, MotorcycleState> {
  final GetListMotorcyclesUseCase getListMotorcyclesUseCase;
  MotorcycleBloc({required this.getListMotorcyclesUseCase}) : super(MotorcycleEmpty()) {
    on<MotorcycleEvent>((event, emit) => _getListMotorcycles(event, emit));
  }

  _getListMotorcycles(MotorcycleEvent event, Emitter<MotorcycleState> emit) async {
    emit(MotorcycleLoading());
    final failureOrMotorcycles = await getListMotorcyclesUseCase(NoParams());
    failureOrMotorcycles.fold(
      (failure) => emit(const MotorcycleError(message: 'Failed getting data')),
      (motorcycles) => emit(MotorcycleLoaded(motorcycles: motorcycles)),
    );
  }
}
