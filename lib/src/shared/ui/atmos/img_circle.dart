import 'package:flutter/material.dart';

import 'img_circle_btn_edit.dart';

class ImgCircleAtom extends StatelessWidget {
  final double? radius;
  final bool? edit;
  const ImgCircleAtom({Key? key, this.radius, this.edit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      backgroundImage: const AssetImage('assets/img/xtz.jpg'),
      child: edit == true ? const ImgCircleBtnEditAtom() : null,
    );
  }
}
