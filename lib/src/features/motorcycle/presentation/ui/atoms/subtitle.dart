import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/text_atom.dart';

class SubTitleAtom extends StatelessWidget {
  final String model;
  const SubTitleAtom({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return H6(text: model.toString());
  }
}
