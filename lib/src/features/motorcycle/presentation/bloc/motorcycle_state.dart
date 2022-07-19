part of 'motorcycle_bloc.dart';

abstract class MotorcycleState extends Equatable {
  const MotorcycleState();
  
  @override
  List<Object> get props => [];
}

class MotorcycleEmpty extends MotorcycleState {}

class MotorcycleLoading extends MotorcycleState {}

class MotorcycleLoaded extends MotorcycleState {
  final List<MotorcycleEntity> motorcycles;
  const MotorcycleLoaded({required this.motorcycles});
  @override
  List<Object> get props => [motorcycles];
}

class MotorcycleError extends MotorcycleState {
  final String message;
  const MotorcycleError({required this.message});
  @override
  List<Object> get props => [message];
}

class MotorcycleSaved extends MotorcycleState {}
