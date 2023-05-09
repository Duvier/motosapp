import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../bloc/motorcycle_detail_bloc.dart';
import '../organisms/detail_motorcycle_bloc.dart';

class DetailMotorcyclePage extends StatelessWidget {
  const DetailMotorcyclePage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    // final args = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
        // print('Argumentos: $args');
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<MotorcycleDetailBloc>(
          create: (context) => service_cotainer<MotorcycleDetailBloc>()
            ..add(GetMotorcycleDetailEvent(id: id)),
          child: const DetailMotorcycleOrganismBloc(),
        ),
      ),
    );
  }
}
