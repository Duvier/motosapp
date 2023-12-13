import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../../shared/ui/molecules/scaffold.dart';
import '../../bloc/motorcycle_detail_bloc.dart';
import '../organisms/detail_motorcycle_bloc.dart';

class DetailMotorcyclePage extends StatelessWidget {
  const DetailMotorcyclePage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMolecule(
      body: SafeArea(
        child: BlocProvider<MotorcycleDetailBloc>(
          create: (context) => serviceCotainer<MotorcycleDetailBloc>()
            ..add(GetMotorcycleDetailEvent(id: id)),
          child: const DetailMotorcycleOrganismBloc(),
        ),
      ),
    );
  }
}
