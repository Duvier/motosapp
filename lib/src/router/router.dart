import 'package:go_router/go_router.dart';

import './routes.dart';
import '../features/dashboard/presentation/ui/pages/dashboard_page.dart';
import '../features/motorcycle/presentation/ui/pages/detail_motorcycle_page.dart';
import '../features/motorcycle/presentation/ui/pages/form_motorcycle_page.dart';
import '../features/motorcycle/presentation/ui/pages/list_motorcycles_page.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      name: Routes.home,
      path: '/',
      builder: (_, __) => const DashboardPage(),
    ),
    GoRoute(
      name: Routes.motorcycles,
      path: '/motorcycles',
      builder: (_, __) => const ListMotorcyclesPage(),
    ),
    GoRoute(
      name: Routes.addMotorcycle,
      path: '/add_motorcycle',
      builder: (_, __) => const FormMotorcyclePage(),
    ),
    GoRoute(
      name: Routes.detailMotorcycle,
      path: '/detail_motorcycle/:id',
      builder: (_, state) => DetailMotorcyclePage(id: state.params['id'] ?? ''),
    ),
  ],
);
