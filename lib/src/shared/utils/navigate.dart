import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motosapp/src/shared/extensions/push_named_if_not_current.dart';

import '../../router/routes.dart';

void navigateTo(BuildContext context, String routeName, [Map<String, String>? arguments]) {
  print(arguments);
  if (arguments != null) {
    GoRouter.of(context).pushNamed(routeName, params: arguments);
  } else {
    GoRouter.of(context).pushNamed(routeName);
  }
  // Navigator.of(context).pushNamedIfNotCurrent(routeName, arguments);
}
