part of 'motorcycle_bloc.dart';

abstract class MotorcycleEvent extends Equatable {
  const MotorcycleEvent();

  @override
  List<Object> get props => [];
}

class GetListMotorcyclesEvent extends MotorcycleEvent {}