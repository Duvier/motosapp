import 'package:flutter/material.dart';

import '../atmos/img_circle.dart';
import '../atmos/text_atom.dart';

class AppBarMolecule extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarMolecule({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      // color: Colors.blue,
      child: SafeArea(
        child: Row(
          children: [
            const ImgCircleAtom(path: 'assets/img/profile.jpg' ,radius: 25),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Label(text: 'Hola de nuevo 👋'),
                H3(text: 'Duvier Marin'),
              ],
            ),
            const Spacer(),
            const IconButton(
              onPressed: null,
              iconSize: 30.0,
              icon: Icon(Icons.notifications),
            )
          ],
        ),
      ),
    );
  }
}
