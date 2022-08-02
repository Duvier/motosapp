import 'package:flutter/material.dart';

import '../organisms/dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DashboardOrganism(),
      ),
    );
  }
}
