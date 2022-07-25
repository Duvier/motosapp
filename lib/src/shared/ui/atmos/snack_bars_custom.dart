import 'package:flutter/material.dart';

import 'snack_bar_base.dart';

class SnackBarSuccess {
  final String message;
  const SnackBarSuccess({required this.message});

  SnackBar call() {
    return SnackBarBase(
      content: Text(message),
      color: Colors.green,
    ).call();
  }
}

class SnackBarError {
  final String message;
  const SnackBarError({required this.message});

  SnackBar call() {
    return SnackBarBase(
      content: Text(message),
      color: Colors.red,
    ).call();
  }
}
