import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/motorcycle_detail_bloc.dart';
import '../molecules/btn_add.dart';

class DetailMotorcycleOrganism extends StatelessWidget {
  const DetailMotorcycleOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<MotorcycleDetailBloc, MotorcycleDetailState>(
              builder: (context, state) {
                if (state is MotorcycleDetailEmpty) {
                  return const Center(
                    child: Text(
                      'Aún no hay motos, agrega una usando el botón de la parte superiror para verla ene ste listado',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  );
                } else if (state is MotorcycleDetailLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MotorcycleDetailLoaded) {
                  return Center(child: Text(state.motorcycle.name));
                } else if (state is MotorcycleDetailError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('MotosApp'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
