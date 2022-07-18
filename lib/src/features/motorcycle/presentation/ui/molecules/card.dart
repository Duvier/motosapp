import 'package:flutter/material.dart';

import '../../../../../shared/ui/app_colors.dart';
import '../../../domain/entities/motorcycle_entity.dart';
import '../atoms/img.dart';
import '../atoms/subtitle.dart';
import '../atoms/title.dart';

class CardMolecule extends StatelessWidget {
  final MotorcycleEntity motorcycle;
  const CardMolecule({Key? key, required this.motorcycle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 80.0,
      child: Row(
        children: [
          const ImgAtom(),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleAtom(name: motorcycle.name),
              SubTitleAtom(model: motorcycle.model),
            ],
          ),
        ],
      ),
    );
  }
}
