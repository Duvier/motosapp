import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/card_base.dart';
import '../../../../../shared/utils/navigate.dart';

class BtnAdd extends StatelessWidget {
  const BtnAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardBaseAtom(
      onTap: () => navigateTo(context, 'add_motorcycle'),
      color: Colors.blue.shade300,
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
