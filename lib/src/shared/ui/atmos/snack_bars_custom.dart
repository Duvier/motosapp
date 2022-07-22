import 'package:flutter/material.dart';

import 'snack_bar_base.dart';

class SnackBarSuccess {
  final String message;
  const SnackBarSuccess({required this.message});

  void call(BuildContext context) {
    SnackBarBase(
      content: Text(message),
      color: Colors.green,
    );
  }
}

class SnackBarError {
  final String message;
  const SnackBarError({required this.message});

  void call(BuildContext context) {
    SnackBarBase(
      content: Text(message),
      color: Colors.red,
    );
  }
}
