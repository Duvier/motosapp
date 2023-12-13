
import 'package:flutter/material.dart';

class ImgCircleBtnEditAtom extends StatelessWidget {
  const ImgCircleBtnEditAtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}