import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/text_atom.dart';

class TitleAtom extends StatelessWidget {
  final String name;
  const TitleAtom({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return H4(text: name, textLight: true);
  }
}
