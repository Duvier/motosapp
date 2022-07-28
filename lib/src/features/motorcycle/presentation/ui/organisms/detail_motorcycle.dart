import 'package:flutter/material.dart';
import 'package:motosapp/src/features/motorcycle/domain/entities/motorcycle_entity.dart';
import 'package:motosapp/src/features/motorcycle/presentation/ui/molecules/detail_motorcycle_header.dart';

class DetailMotorcycleOrganism extends StatelessWidget {
  final MotorcycleEntity motorcycle;
  const DetailMotorcycleOrganism({Key? key, required this.motorcycle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailMotorcycleHeaderMolecule(motorcycle: motorcycle),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: const [
                Item(),
                Divider(),
                Item(),
                Divider(),
                Item(),
                Divider(),
                Item(),
                Divider(),
                Item(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Nombre del mantenimiento'),
      trailing: Text('3'),
    );
  }
}
