import 'package:flutter/material.dart';

import '../../../../../shared/ui/molecules/scaffold.dart';
import '../organisms/dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldMolecule(
      titleAppBar: 'MotosApp',
      body: SafeArea(
        child: DashboardOrganism(),
      ),
    );
  }
}
