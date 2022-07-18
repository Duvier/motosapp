import 'package:flutter/material.dart';

import '../app_colors.dart';

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
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: AppColors.textLight,
      ),
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

class H2 extends StatelessWidget {
  final String text;
  const H2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 30.0, fontWeight: FontWeight.bold);
  }
}

class H3 extends StatelessWidget {
  final String text;
  const H3({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 25.0, fontWeight: FontWeight.bold);
  }
}

class H4 extends StatelessWidget {
  final String text;
  const H4({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 20.0, fontWeight: FontWeight.bold);
  }
}

class H5 extends StatelessWidget {
  final String text;
  const H5({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 18.0, fontWeight: FontWeight.bold);
  }
}

class H6 extends StatelessWidget {
  final String text;
  const H6({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 15.0, fontWeight: null);
  }
}
 