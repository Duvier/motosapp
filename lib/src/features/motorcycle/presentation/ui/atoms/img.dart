import 'package:flutter/material.dart';

class ImgAtom extends StatelessWidget {
  const ImgAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/default.png',
      height: 40.0,
      // width: 50.0,
    );
  }
}
