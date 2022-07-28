import 'package:flutter/material.dart';

import 'img_circle_btn_edit.dart';

class ImgCircleAtom extends StatelessWidget {
  final String path;
  final double? radius;
  final bool? edit;
  const ImgCircleAtom({Key? key, this.radius, this.edit = false, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(path),
      child: edit == true ? const ImgCircleBtnEditAtom() : null,
    );
  }
}
