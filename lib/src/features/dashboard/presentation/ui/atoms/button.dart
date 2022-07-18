import 'package:flutter/material.dart';

class ButtonAtom extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const ButtonAtom({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
