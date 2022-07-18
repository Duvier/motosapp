import 'package:flutter/material.dart';

import '../features/dashboard/presentation/ui/pages/dashboard_page.dart';
import '../features/motorcycle/presentation/ui/pages/list_motorcycles_page.dart';

Map<String, Widget Function(BuildContext)> routes(BuildContext context) => {
      '/': (_) => const DashboardPage(),
      'motorcycle': (_) => const ListMotorcyclesPage(),
    };