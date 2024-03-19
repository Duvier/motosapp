import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/card_base.dart';
import '../molecules/form_maintenance_type.dart';

class AddMaintenanceTypeForm extends StatelessWidget {
  AddMaintenanceTypeForm({super.key});
  final formMaintenanceTypeKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CardBaseAtom(
      child: Column(
        children: [
          FormMaintenanceType(formKey: formMaintenanceTypeKey)
        ],
      ),
    );
  }
}
