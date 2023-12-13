import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/card_base.dart';
import '../../../../maintenance/presentation/ui/molecules/maintenance_card.dart';
import '../../../domain/entities/motorcycle_entity.dart';
import '../molecules/detail_motorcycle_header.dart';

class DetailMotorcycleOrganism extends StatelessWidget {
  final MotorcycleEntity motorcycle;
  const DetailMotorcycleOrganism({Key? key, required this.motorcycle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailMotorcycleHeaderMolecule(motorcycle: motorcycle),
        const SizedBox(height: 10.0),
        const MaintenanceCard(),
        const SizedBox(height: 10.0),
        Expanded(
          child: CardBaseAtom(
            child: ListView(
              children: const [
                Item(),
                Divider(height: 2),
                Item(),
                Divider(height: 2),
                Item(),
                Divider(height: 2),
                Item(),
                Divider(height: 2),
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
      title: Text('Cambio de aceite'),
      subtitle: Text('10 de diciembre del 2023'),
      trailing: Text('\$ 130.000'),
    );
  }
}
