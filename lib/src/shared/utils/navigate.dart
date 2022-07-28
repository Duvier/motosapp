import 'package:flutter/material.dart';

void navigateTo(BuildContext context, String routeName) {
  // Navigator.of(context).pushNamed(routeName);
  Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
}