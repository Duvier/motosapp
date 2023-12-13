import 'package:flutter/material.dart';
import 'package:motosapp/src/features/maintenance/presentation/ui/molecules/maintenance_card.dart';

import '../../../../motorcycle/presentation/ui/organisms/list_motorcycles.dart';

class DashboardOrganism extends StatelessWidget {
  const DashboardOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Placeholder(fallbackHeight: 170.0),
        SizedBox(height: 10.0),
        MaintenanceCard(),
        SizedBox(height: 10.0),
        Expanded(child: ListMotorcyclesOrganism()),
      ],
    );
  }
}