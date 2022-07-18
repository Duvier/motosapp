import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:motosapp/src/features/motorcycle/data/models/motorcycle_model.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const model = MotorcycleModel(
    name: 'La morronga',
    brand: 'Yamaha',
    model: '2012',
    image: 'image.jpg',
    cylinderCapacity: 125,
  );
  final listModel = [model, const MotorcycleModel(name: 'El bolido', brand: 'AKT', model: '2008', image: 'image.jpg', cylinderCapacity: 125)];

  test('Debería ser una subclase de MotorcycleEntity', () {
    // arrange
    // act
    // assert
    expect(model, isA<MotorcycleEntity>());
  });

  test('Debería retornar un modelo a partir de un json', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('motorcycle.json'));
    // act
    final result = MotorcycleModel.fromJson(jsonMap);
    // assert
    expect(result, model);
  });
  
  test('Debería retornar un listado de modelos a partir de un json', () {
    // arrange
    final List<dynamic> jsonMap = json.decode(fixture('motorcycles.json'));
    // act
    final result = MotorcycleModel.formListJson(jsonMap);
    // assert
    expect(result, listModel);
  });

}
