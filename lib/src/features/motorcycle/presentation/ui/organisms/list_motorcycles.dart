import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/ui/atmos/snack_bars_custom.dart';
import '../../bloc/motorcycle_bloc.dart';
import '../molecules/item_motorcycle.dart';

class ListMotorcyclesOrganism extends StatelessWidget {
  const ListMotorcyclesOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: BlocConsumer<MotorcycleBloc, MotorcycleState>(
              listenWhen: (context, state) =>
                  state is MotorcycleDeleted || state is MotorcycleError,
              listener: (context, state) {
                if (state is MotorcycleDeleted) {
                  final snackBar = const SnackBarSuccess(
                          message: 'Registro eliminado con éxito')
                      .call();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  BlocProvider.of<MotorcycleBloc>(context)
                      .add(GetListMotorcyclesEvent());
                } else if (state is MotorcycleError) {
                  final snackBar =
                      const SnackBarError(message: 'Error al eliminar').call();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
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
                      return ItemMotorcycleMolecule(motorcycle: state.motorcycles[index]);
                    },
                  );
                } else if (state is MotorcycleError) {
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
