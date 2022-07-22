// Mocks generated by Mockito 5.2.0 from annotations
// in motosapp/test/src/features/motorcycle/domain/usecases/get_list_motorcycles_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:motosapp/models/Motorcycle.dart' as _i8;
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart'
    as _i6;
import 'package:motosapp/src/features/motorcycle/domain/repositories/motorcycle_repository.dart'
    as _i3;
import 'package:motosapp/src/shared/errors/failures.dart' as _i5;
import 'package:motosapp/src/shared/usescases/usecase.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [MotorcycleRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMotorcycleRepository extends _i1.Mock
    implements _i3.MotorcycleRepository {
  MockMotorcycleRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.MotorcycleEntity>>>
      getListMotorcycles() => (super.noSuchMethod(
          Invocation.method(#getListMotorcycles, []),
          returnValue: Future<
                  _i2.Either<_i5.Failure, List<_i6.MotorcycleEntity>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.MotorcycleEntity>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.MotorcycleEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> saveMotorcycle(
          _i7.ParamsMotorcycle? params) =>
      (super.noSuchMethod(Invocation.method(#saveMotorcycle, [params]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither_0<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> deleteMotorcycle(
          _i8.Motorcycle? model) =>
      (super.noSuchMethod(Invocation.method(#deleteMotorcycle, [model]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither_0<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
