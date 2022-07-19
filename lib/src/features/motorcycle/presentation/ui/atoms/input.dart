import 'package:flutter/material.dart';

class InputAtom extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  const InputAtom({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El campo $labelText no puede ir vacío';
        }
        return null;
      },
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
