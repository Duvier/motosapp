import '../../domain/entities/maintenance_type_entity.dart';

class MaintenanceTypeMapper {
  Map<String, dynamic> toMap(MaintenanceTypeEntity maintenanceTypeEntity) {
    return {
      'name': maintenanceTypeEntity.name,
      'periodicityCant': maintenanceTypeEntity.periodicityCant,
      'periodicityTerm': maintenanceTypeEntity.periodicityTerm,
      'advanceNotificationCant': maintenanceTypeEntity.advanceNotificationCant,
      'advanceNotificationTerm': maintenanceTypeEntity.advanceNotificationTerm,
    };
  }

  MaintenanceTypeEntity toMaintenanceEntity(Map json) {
    return MaintenanceTypeEntity(
      name: json['name'],
      periodicityCant: json['periodicityCant'],
      periodicityTerm: json['periodicityTerm'],
      advanceNotificationCant: json['advanceNotificationCant'],
      advanceNotificationTerm: json['advanceNotificationTerm'],
    );
  }

  toListMaintenanceEntity(List<dynamic> listJson) {
    List<MaintenanceTypeEntity> listMaintenanceType = [];
    for (var json in listJson) {
      listMaintenanceType.add(toMaintenanceEntity(json));
    }
    return listMaintenanceType;
  }

}
