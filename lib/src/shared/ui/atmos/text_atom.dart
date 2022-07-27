import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_font.dart';

class TextAtom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool textLight;
  const TextAtom({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: AppFontFamily.primary,
        color: textLight ? AppColors.textLight : AppColors.textDark,
      ),
    );
  }
}

class H1 extends StatelessWidget {
  final String text;
  final bool textLight;
  const H1({Key? key, required this.text, this.textLight = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 45.0, fontWeight: FontWeight.bold, textLight: textLight);
  }
}

class H2 extends StatelessWidget {
  final String text;
  final bool textLight;
  const H2({Key? key, required this.text, this.textLight = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 30.0, fontWeight: FontWeight.bold, textLight: textLight);
  }
}

class H3 extends StatelessWidget {
  final String text;
  final bool textLight;
  const H3({Key? key, required this.text, this.textLight = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 25.0, fontWeight: FontWeight.bold, textLight: textLight);
  }
}

class H4 extends StatelessWidget {
  final String text;
  final bool textLight;
  const H4({Key? key, required this.text, this.textLight = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 20.0, fontWeight: FontWeight.bold, textLight: textLight);
  }
}

class H5 extends StatelessWidget {
  final String text;
  final bool textLight;
  const H5({Key? key, required this.text, this.textLight = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 18.0, fontWeight: FontWeight.w600, textLight: textLight);
  }
}

class H6 extends StatelessWidget {
  final String text;
  final bool textLight;
  const H6({Key? key, required this.text, this.textLight = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 15.0, fontWeight: FontWeight.w500, textLight: textLight);
  }
}

class Label extends StatelessWidget {
  final String text;
  final bool textLight;
  const Label({Key? key, required this.text, this.textLight = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAtom(text: text, fontSize: 11.0, fontWeight: FontWeight.w400, textLight: textLight);
  }
}
 