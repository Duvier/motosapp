import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/motorcycle_entity.dart';
import '../../bloc/motorcycle_bloc.dart';
import '../atoms/img.dart';
import '../atoms/subtitle.dart';
import '../atoms/title.dart';

class CardMolecule extends StatelessWidget {
  final MotorcycleEntity motorcycle;
  const CardMolecule({Key? key, required this.motorcycle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        tileColor: Colors.blue,
        leading: const ImgAtom(),
        title: TitleAtom(name: motorcycle.name),
        subtitle: SubTitleAtom(model: motorcycle.brand),
        trailing: IconButton(
          onPressed: () => _delete(context),
          icon: const Icon(Icons.delete),
        ),
      ),
    );
    // return CardBaseAtom(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       const ImgAtom(),
    //       const SizedBox(width: 15.0),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           TitleAtom(name: motorcycle.name),
    //           SubTitleAtom(model: motorcycle.brand),
    //         ],
    //       ),
    //       const IconButton(onPressed: null, icon: Icon(Icons.delete))
    //     ],
    //   ),
    // );
  }
  
  _delete(BuildContext context) {
    BlocProvider.of<MotorcycleBloc>(context).add(DeleteMotorcycleEvent(motorcycle.brand));
  }
}
