import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/text_atom.dart';
import '../organisms/dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const H2(text: 'Hola 👋🏻'),
      ),
      body: const SafeArea(
        child: DashboardOrganism(),
      ),
    );
  }
}
