import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../bloc/motorcycle_detail_bloc.dart';
import '../organisms/detail_motorcycle.dart';

class DetailMotorcyclePage extends StatelessWidget {
  const DetailMotorcyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de moto'),
      ),
      body: BlocProvider<MotorcycleDetailBloc>(
        create: (context) => sl<MotorcycleDetailBloc>()..add(GetMotorcycleDetailEvent(id: args['id'])),
        child: const DetailMotorcycleOrganism(),
      ),
    );
  }
}
