part of 'maintenance_type_bloc.dart';

abstract class MaintenanceTypeState extends Equatable {
  const MaintenanceTypeState();
  @override
  List<Object> get props => [];
}

class MaintenanceTypeEmpty extends MaintenanceTypeState {}

class MaintenanceTypeLoading extends MaintenanceTypeState {}

class MaintenanceTypeSaved extends MaintenanceTypeState {}

class MaintenanceTypeDeleted extends MaintenanceTypeState {}

class MaintenanceTypeLoaded extends MaintenanceTypeState {
  final List<MaintenanceTypeEntity> listMaintenanceType;
  const MaintenanceTypeLoaded({required this.listMaintenanceType});
  @override
  List<Object> get props => [listMaintenanceType];
}

class MaintenanceTypeError extends MaintenanceTypeState {
  final String message;
  const MaintenanceTypeError({required this.message});
  @override
  List<Object> get props => [message];
}