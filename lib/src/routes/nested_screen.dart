// import 'package:flutter/material.dart';

// import '../shared/ui/navigator_keys.dart';
// import '../router/routes.dart';

// class NestedScreen extends StatelessWidget {
//   const NestedScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final routes = Routes(context).call();
//     return Navigator(
//       key: NavigatorKeys.bottomNavigationBarFirstItem,
//       initialRoute: '/',
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           settings: routeSettings,
//           builder: (context) => routes[routeSettings.name]!(context),
//         );
//       },
//     );
//   }

// }
