import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motosapp/src/features/motorcycle/presentation/ui/organisms/detail_motorcycle.dart';

import '../../bloc/motorcycle_detail_bloc.dart';

class DetailMotorcycleOrganismBloc extends StatelessWidget {
  const DetailMotorcycleOrganismBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MotorcycleDetailBloc, MotorcycleDetailState>(
      builder: (context, state) {
        if (state is MotorcycleDetailEmpty) {
          return const Center(
            child: Text(
              'Placeholder',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          );
        } else if (state is MotorcycleDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MotorcycleDetailLoaded) {
          return DetailMotorcycleOrganism(motorcycle: state.motorcycle);
        } else if (state is MotorcycleDetailError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('MotosApp'));
      },
    );
  }
}
