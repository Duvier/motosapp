import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navigateTo(BuildContext context, String routeName, [Map<String, String>? arguments]) {
  if (arguments != null) {
    GoRouter.of(context).pushNamed(routeName, params: arguments);
  } else {
    GoRouter.of(context).pushNamed(routeName);
  }
  // Navigator.of(context).pushNamedIfNotCurrent(routeName, arguments);
}
