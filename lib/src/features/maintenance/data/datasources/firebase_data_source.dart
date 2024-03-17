import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../shared/errors/exceptions.dart';
import '../../domain/datasource/maintenance_type_datasource.dart';
import '../../domain/entities/maintenance_type_entity.dart';
import 'maintenance_type_mapper.dart';

class FirebaseMaintenanceTypeDataSourceImpl
    implements MaintenanceTypeDataSource {
  final db = FirebaseFirestore.instance;
  final mapper = MaintenanceTypeMapper();
  static const collection = 'maintenanceType';

  @override
  Future<List<MaintenanceTypeEntity>> getListMaintenanceType() async {
    try {
      List<MaintenanceTypeEntity> listMaintenanceType = [];
      await db.collection(collection).get().then((event) {
        listMaintenanceType = mapper.toListMaintenanceEntity(event.docs);
      });
      return listMaintenanceType;
    } catch (e) {
      debugPrint('Error en DataSource $e');
      throw ServerException();
    }
  }

  @override
  Future<MaintenanceTypeEntity> getMaintenanceType(String id) async {
    try {
      late MaintenanceTypeEntity maintenanceTypeEntity;
      await db.collection(collection).doc(id).get().then((value) {
        maintenanceTypeEntity = mapper.toMaintenanceEntity(value.data()!);
      }).catchError((e) {
        throw ServerException();
      });
      return maintenanceTypeEntity;
    } catch (e) {
      debugPrint('Error en DataSource $e');
      throw ServerException();
    }
  }

  @override
  Future<void> saveMaintenanceType(
    MaintenanceTypeEntity maintenanceTypeEntity,
  ) async {
    try {
      final maintenanceType = mapper.toMap(maintenanceTypeEntity);
      await db.collection(collection).add(maintenanceType);
    } catch (e) {
      debugPrint('Error en DataSource $e');
      throw ServerException();
    }
  }

  @override
  Future<void> deleteMaintenanceType(String id) async {
    try {
      // Eliminar en Firebase
    } catch (e) {
      debugPrint('Error en DataSource $e');
      throw ServerException();
    }
  }
}
