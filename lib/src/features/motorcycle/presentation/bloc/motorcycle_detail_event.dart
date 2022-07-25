part of 'motorcycle_detail_bloc.dart';

abstract class MotorcycleDetailEvent extends Equatable {
  const MotorcycleDetailEvent();

  @override
  List<Object> get props => [];
}

class GetMotorcycleDetailEvent extends MotorcycleDetailEvent{
  final String id;
  const GetMotorcycleDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}