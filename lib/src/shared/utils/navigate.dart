import 'package:flutter/material.dart';
import 'package:motosapp/src/shared/extensions/push_named_if_not_current.dart';

void navigateTo(BuildContext context, String routeName, [arguments]) {
  Navigator.of(context).pushNamedIfNotCurrent(routeName, arguments);
}
