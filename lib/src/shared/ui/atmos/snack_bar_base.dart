import 'package:flutter/material.dart';

class SnackBarBase {
  final Color color;
  final Widget content;
  const SnackBarBase({Key? key, required this.content, required this.color});

  SnackBar call() {
    return  SnackBar(
      content: content,
      backgroundColor: color,
    );
    
  }
}
