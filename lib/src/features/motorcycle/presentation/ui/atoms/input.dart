import 'package:flutter/material.dart';

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
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
