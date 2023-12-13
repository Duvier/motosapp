import 'package:flutter/material.dart';

import '../../../../../shared/ui/app_colors.dart';
import '../../../../../shared/ui/atmos/card_base.dart';
import '../../../../../shared/ui/atmos/text_atom.dart';

class MaintenanceCard extends StatelessWidget {
  const MaintenanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardBaseAtom(
      color: AppColors.warning,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        minLeadingWidth: 30,
        leading: SizedBox(height: double.infinity,child: Icon(Icons.build)),
        title: H5(text: 'SOAT'),
        subtitle: H6(text: '24 de diciembre del 2023'),
      ),
    );
  }
}
