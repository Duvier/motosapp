import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/text_atom.dart';

class InfoDetailAtom extends StatelessWidget {
  final String label;
  final String value;
  const InfoDetailAtom({
    Key? key, required this.label, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: label),
        // const SizedBox(height: 05.0),
        H6(text: value),
      ],
    );
  }
}