import 'package:flutter/material.dart';

import '../molecules/dm_navitation.dart';

class DashboardOrganism extends StatelessWidget {
  const DashboardOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Placeholder(fallbackHeight: 200.0),
          SizedBox(height: 40.0),
          DmNavigation()
        ],
      ),
    );
  }
}