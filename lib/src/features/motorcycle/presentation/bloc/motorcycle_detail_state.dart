part of 'motorcycle_detail_bloc.dart';

abstract class MotorcycleDetailState extends Equatable {
  const MotorcycleDetailState();
  
  @override
  List<Object> get props => [];
}

class MotorcycleDetailEmpty extends MotorcycleDetailState {}

class MotorcycleDetailLoading extends MotorcycleDetailState {}

class MotorcycleDetailSaved extends MotorcycleDetailState {}

class MotorcycleDetailDeleted extends MotorcycleDetailState {}

class MotorcycleDetailLoaded extends MotorcycleDetailState {
  final MotorcycleEntity motorcycle;
  const MotorcycleDetailLoaded({required this.motorcycle});
  @override
  List<Object> get props => [motorcycle];
}

class MotorcycleDetailError extends MotorcycleDetailState {
  final String message;
  const MotorcycleDetailError({required this.message});
  @override
  List<Object> get props => [message];
}