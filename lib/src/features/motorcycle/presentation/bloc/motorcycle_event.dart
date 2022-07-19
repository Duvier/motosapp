part of 'motorcycle_bloc.dart';

abstract class MotorcycleEvent extends Equatable {
  const MotorcycleEvent();

  @override
  List<Object> get props => [];
}

class GetListMotorcyclesEvent extends MotorcycleEvent {}

class SaveMotorcyclesEvent extends MotorcycleEvent {
  final ParamsMotorcycle params;
  const SaveMotorcyclesEvent(this.params);

  @override
  List<Object> get props => [params];
}

class DeleteMotorcycleEvent extends MotorcycleEvent {
  final String id;
  const DeleteMotorcycleEvent(this.id);

  @override
  List<Object> get props => [id];
}
