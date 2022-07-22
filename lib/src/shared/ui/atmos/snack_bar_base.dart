import 'package:flutter/material.dart';

class SnackBarBase {
  final Color color;
  
  final Widget content;
  const SnackBarBase({Key? key, required this.color, required this.content});

  void call(BuildContext context) {
    final snackBar =  SnackBar(
      content: content,
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
