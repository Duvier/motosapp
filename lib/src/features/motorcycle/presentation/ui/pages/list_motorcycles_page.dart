import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../bloc/motorcycle_bloc.dart';
import '../organisms/list_motorcycles.dart';

class ListMotorcyclesPage extends StatelessWidget {
  const ListMotorcyclesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de motos'),
      ),
      body: BlocProvider(
        create: (context) => sl<MotorcycleBloc>()..add(GetListMotorcyclesEvent()),
        child: const ListMotorcycleBody(),
      ),
    );
  }
}

class ListMotorcycleBody extends StatelessWidget {
  const ListMotorcycleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MotorcycleBloc, MotorcycleState>(
      builder: (context, state) {
        if (state is MotorcycleEmpty) {
          return const Center(child: Text('Empty'));
        } else if(state is MotorcycleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if(state is MotorcycleLoaded){
          return ListMotorcyclesOrganism(motorcycles: state.motorcycles);
        } else if(state is MotorcycleError){
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('Por defecto'));
      },
    );
  }
}
