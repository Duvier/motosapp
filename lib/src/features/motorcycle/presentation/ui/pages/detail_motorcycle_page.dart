import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motosapp/src/shared/ui/app_colors.dart';

import '../../../../../injection_container.dart';
import '../../bloc/motorcycle_detail_bloc.dart';
import '../organisms/detail_motorcycle_bloc.dart';

class DetailMotorcyclePage extends StatelessWidget {
  const DetailMotorcyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: const Text('Detalle de moto'),
      ),
      body: SafeArea(
        child: BlocProvider<MotorcycleDetailBloc>(
          create: (context) => sl<MotorcycleDetailBloc>()..add(GetMotorcycleDetailEvent(id: args['id'])),
          child: const DetailMotorcycleOrganismBloc(),
        ),
      ),
    );
  }
}
