import 'package:flutter/material.dart';

import '../features/dashboard/presentation/ui/pages/dashboard_page.dart';
import '../features/motorcycle/presentation/ui/pages/form_motorcycle_page.dart';
import '../features/motorcycle/presentation/ui/pages/list_motorcycles_page.dart';

class Routes {
  final BuildContext context;
  Routes(this.context);

  Map<String, Widget Function(BuildContext)> call() {
    return {
      '/': (_) => const DashboardPage(),
      'motorcycles': (_) => const ListMotorcyclesPage(),
      'add_motorcycle': (_) => const FormMotorcyclePage(),
    };
  }
}
