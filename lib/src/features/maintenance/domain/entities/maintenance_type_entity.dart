import 'package:equatable/equatable.dart';

class MaintenanceTypeEntity extends Equatable {
  final String name;
  final int periodicityCant;
  final String periodicityTerm;
  final int advanceNotificationCant;
  final String advanceNotificationTerm;

  const MaintenanceTypeEntity({
    required this.name,
    required this.periodicityCant,
    required this.periodicityTerm,
    required this.advanceNotificationCant,
    required this.advanceNotificationTerm,
  });

  @override
  List<Object?> get props => [
        name,
        periodicityCant,
        periodicityTerm,
        advanceNotificationCant,
        advanceNotificationTerm,
      ];
}
