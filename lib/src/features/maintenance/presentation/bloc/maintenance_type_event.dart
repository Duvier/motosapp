part of 'maintenance_type_bloc.dart';

abstract class MaintenanceTypeEvent extends Equatable {
  const MaintenanceTypeEvent();

  @override
  List<Object> get props => [];
}

class GetListMaintenanceTypeEvent extends MaintenanceTypeEvent {}

class SaveMaintenanceTypeEvent extends MaintenanceTypeEvent {
  final MaintenanceTypeEntity maintenanceTypeEntity;
  const SaveMaintenanceTypeEvent(this.maintenanceTypeEntity);

  @override
  List<Object> get props => [maintenanceTypeEntity];
}

class DeleteMaintenanceTypeEvent extends MaintenanceTypeEvent {
  final String id;
  const DeleteMaintenanceTypeEvent(this.id);

  @override
  List<Object> get props => [id];
}
