// Mocks generated by Mockito 5.4.0 from annotations
// in motosapp/test/src/features/motorcycle/data/repositories/motorcycle_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:motosapp/src/features/motorcycle/data/datasources/datasource.dart'
    as _i3;
import 'package:motosapp/src/features/motorcycle/data/models/motorcycle_model.dart'
    as _i2;
import 'package:motosapp/src/shared/usescases/usecase.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMotorcycleModel_0 extends _i1.SmartFake
    implements _i2.MotorcycleModel {
  _FakeMotorcycleModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataSource extends _i1.Mock implements _i3.DataSource {
  MockDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.MotorcycleModel>> getListMotorcycles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getListMotorcycles,
          [],
        ),
        returnValue: _i4.Future<List<_i2.MotorcycleModel>>.value(
            <_i2.MotorcycleModel>[]),
      ) as _i4.Future<List<_i2.MotorcycleModel>>);
  @override
  _i4.Future<_i2.MotorcycleModel> getMotorcycle(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMotorcycle,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.MotorcycleModel>.value(_FakeMotorcycleModel_0(
          this,
          Invocation.method(
            #getMotorcycle,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.MotorcycleModel>);
  @override
  _i4.Future<void> saveMotorcycle(_i5.ParamsMotorcycle? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveMotorcycle,
          [params],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> deleteMotorcycle(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteMotorcycle,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
