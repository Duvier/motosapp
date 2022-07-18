import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motosapp/models/Motorcycle.dart';
import 'package:motosapp/src/features/motorcycle/data/datasources/aws_data_source.dart';

// @GenerateMocks([], customMocks: [
//     MockSpec<AmplifyDataStore>(returnNullOnMissingStub:true, as: #MockAmplifyDatStore),
// ])
void main() {
  late AWSDataSource dataSource;
  // late AmplifyDataStore mockAmplify;
  final listMotorcycleModel = [
    Motorcycle(
      name: 'La morronga',
      brand: 'Yamaha',
      model: '2012',
      cylinderCapacity: 125,
    ),
  ];

  setUp(() {
    // mockAmplify = MockAmplifyDatStore();
    dataSource = AWSDataSourceImpl();
  });

  // test('Debería ser una subclase de AmplifyClass', () async {
  //   // arrange
  //   // act
  //   // assert
  //   expect(mockAmplify, isA<AmplifyDataStore>());
  // });
  
  test('Debería retornar un listado de MotorcycleModel', () async {
    // arrange
    // when(mockAmplify.query<Motorcycle>(Motorcycle.classType))
    //     .thenAnswer((_) async => listMotorcycleModel);
    // act
    final result = await dataSource.getListMotorcycles();
    print(result);
    // assert
    // verify(mockAmplify.query<Motorcycle>(Motorcycle.classType));
    expect(result, listMotorcycleModel);
  });
}
