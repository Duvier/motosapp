import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/ui/app_colors.dart';
import '../../../../../shared/ui/navigator_keys.dart';
import '../../../../../shared/utils/navigate.dart';
import '../../../domain/entities/motorcycle_entity.dart';
import '../../bloc/motorcycle_bloc.dart';
import '../../../../../shared/ui/atmos/img_circle.dart';
import '../atoms/subtitle.dart';
import '../atoms/title.dart';

class ItemMotorcycleMolecule extends StatelessWidget {
  final MotorcycleEntity motorcycle;
  const ItemMotorcycleMolecule({Key? key, required this.motorcycle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        tileColor: AppColors.card,
        leading: const ImgCircleAtom(path: 'assets/img/xtz.jpg'),
        title: TitleAtom(name: motorcycle.name),
        subtitle: SubTitleAtom(model: motorcycle.brand),
        onTap: () => _viewDetail(context, motorcycle.id),
        // trailing: IconButton(
        //   onPressed: () => _delete(context),
        //   icon: const Icon(Icons.delete),
        // ),
      ),
    );
  }

  _delete(BuildContext context) {
    BlocProvider.of<MotorcycleBloc>(context)
        .add(DeleteMotorcycleEvent(motorcycle.id));
  }

  _viewDetail(BuildContext context, String id) {
    // GoRouter.of(context).pushNamed('detail_motorcycle', params: {'id': id});
    navigateTo(
      NavigatorKeys.bottomNavigationBarFirstItem.currentContext ?? context,
      'detail_motorcycle',
      {'id': id},
    );
  }
}
