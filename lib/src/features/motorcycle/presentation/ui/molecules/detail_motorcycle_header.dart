import 'package:flutter/material.dart';

import '../../../../../shared/ui/atmos/img_circle.dart';
import '../../../../../shared/ui/atmos/text_atom.dart';
import '../../../domain/entities/motorcycle_entity.dart';
import '../atoms/card.dart';
import '../atoms/info_detail.dart';

class DetailMotorcycleHeaderMolecule extends StatelessWidget {
  final MotorcycleEntity motorcycle;
  const DetailMotorcycleHeaderMolecule({Key? key, required this.motorcycle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardAtom(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H4(text: motorcycle.name),
                const SizedBox(height: 07.0),
                InfoDetailAtom(label: 'Marca', value: motorcycle.brand),
                const SizedBox(height: 07.0),
                Row(
                  children: [
                    InfoDetailAtom(label: 'Modelo', value: motorcycle.model),
                    const SizedBox(width: 50.0),
                    InfoDetailAtom(
                      label: 'Cilindraje',
                      value: motorcycle.cylinderCapacity.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const ImgCircleAtom(path: 'assets/img/xtz.jpg', radius: 60),
        ],
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(15.0),
    //     color: Colors.white,
    //   ),
    //   margin: const EdgeInsets.all(15.0),
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    //   alignment: Alignment.center,
    //   child: ,
    // );
  }
}
