// Mocks generated by Mockito 5.4.4 from annotations
// in motosapp/test/src/features/maintenance/domain/usecases/get_list_maintenance_type_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:motosapp/src/features/maintenance/domain/datasource/maintenance_type_datasource.dart'
    as _i2;
import 'package:motosapp/src/features/maintenance/domain/entities/maintenance_type_entity.dart'
    as _i7;
import 'package:motosapp/src/features/maintenance/domain/repositories/maintenance_type_repository.dart'
    as _i4;
import 'package:motosapp/src/shared/errors/failures.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMaintenanceTypeDataSource_0 extends _i1.SmartFake
    implements _i2.MaintenanceTypeDataSource {
  _FakeMaintenanceTypeDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MaintenanceTypeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMaintenanceTypeRepository extends _i1.Mock
    implements _i4.MaintenanceTypeRepository {
  MockMaintenanceTypeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MaintenanceTypeDataSource get maintenanceTypeDataSource =>
      (super.noSuchMethod(
        Invocation.getter(#maintenanceTypeDataSource),
        returnValue: _FakeMaintenanceTypeDataSource_0(
          this,
          Invocation.getter(#maintenanceTypeDataSource),
        ),
      ) as _i2.MaintenanceTypeDataSource);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.MaintenanceTypeEntity>>>
      getListMaintenanceType() => (super.noSuchMethod(
            Invocation.method(
              #getListMaintenanceType,
              [],
            ),
            returnValue: _i5.Future<
                    _i3.Either<_i6.Failure,
                        List<_i7.MaintenanceTypeEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.MaintenanceTypeEntity>>(
              this,
              Invocation.method(
                #getListMaintenanceType,
                [],
              ),
            )),
          ) as _i5.Future<
              _i3.Either<_i6.Failure, List<_i7.MaintenanceTypeEntity>>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.MaintenanceTypeEntity>>
      getMaintenanceType(String? id) => (super.noSuchMethod(
            Invocation.method(
              #getMaintenanceType,
              [id],
            ),
            returnValue: _i5.Future<
                    _i3.Either<_i6.Failure, _i7.MaintenanceTypeEntity>>.value(
                _FakeEither_1<_i6.Failure, _i7.MaintenanceTypeEntity>(
              this,
              Invocation.method(
                #getMaintenanceType,
                [id],
              ),
            )),
          ) as _i5.Future<_i3.Either<_i6.Failure, _i7.MaintenanceTypeEntity>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> saveMaintenanceType(
          _i7.MaintenanceTypeEntity? maintenanceTypeEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveMaintenanceType,
          [maintenanceTypeEntity],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
            _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #saveMaintenanceType,
            [maintenanceTypeEntity],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, void>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> deleteMaintenanceType(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteMaintenanceType,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
            _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #deleteMaintenanceType,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, void>>);
}
