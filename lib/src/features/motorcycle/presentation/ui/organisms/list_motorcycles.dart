import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/motorcycle_bloc.dart';
import '../molecules/btn_add.dart';
import '../molecules/card.dart';

class ListMotorcyclesOrganism extends StatelessWidget {
  const ListMotorcyclesOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const BtnAdd(),
          const SizedBox(height: 5.0),
          Expanded(child: BlocBuilder<MotorcycleBloc, MotorcycleState>(
            builder: (context, state) {
              if (state is MotorcycleEmpty) {
                return const Center(
                  child: Text(
                    'Aún no hay motos, agrega una usando el botón de la parte superiror para verla ene ste listado',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                );
              } else if (state is MotorcycleLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MotorcycleLoaded) {
                return ListView.builder(
                  itemCount: state.motorcycles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardMolecule(motorcycle: state.motorcycles[index]);
                  },
                );
              } else if (state is MotorcycleError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('Por defecto'));
            },
          )),
        ],
      ),
    );
  }
}
