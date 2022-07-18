import 'package:flutter/material.dart';

import '../../../domain/entities/motorcycle_entity.dart';
import '../molecules/card.dart';

class ListMotorcyclesOrganism extends StatelessWidget {
  final List<MotorcycleEntity> motorcycles;
  const ListMotorcyclesOrganism({Key? key, required this.motorcycles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: motorcycles.length,
      itemBuilder: (BuildContext context, int index) { 
        return CardMolecule(motorcycle: motorcycles[index]);
       },
    );
  }
}