import 'package:flutter/material.dart';

import '../../../../../shared/ui/molecules/scaffold.dart';
import '../organisms/add_maintenance_type_form.dart';

class FormMaintenanceTypePage extends StatelessWidget {
  const FormMaintenanceTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMolecule(
      body: AddMaintenanceTypeForm(),
    );
  }
}