import 'package:flutter/material.dart';

import '../app_colors.dart';

class InputAtom extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const InputAtom({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor:const Color.fromARGB(255, 248, 248, 248),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        hintText: hintText,
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: AppColors.primary),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
