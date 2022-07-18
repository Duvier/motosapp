import 'package:flutter/material.dart';

class TextAtom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextAtom({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class H1 extends StatelessWidget {
  final String text;
  const H1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 45.0, fontWeight: FontWeight.bold);
  }
}
