import 'package:flutter/material.dart';

import '../../../../../shared/utils/navigate.dart';
import '../atoms/button.dart';

class DmNavigation extends StatelessWidget {
  const DmNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ButtonAtom(
                text: 'Motos',
                onPressed: () => navigateTo(context, 'motorcycles'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
