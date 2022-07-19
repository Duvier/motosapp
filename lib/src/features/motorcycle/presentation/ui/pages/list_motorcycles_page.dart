import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/motorcycle_bloc.dart';
import '../organisms/list_motorcycles.dart';

class ListMotorcyclesPage extends StatefulWidget {
  const ListMotorcyclesPage({Key? key}) : super(key: key);

  @override
  State<ListMotorcyclesPage> createState() => _ListMotorcyclesPageState();
}

class _ListMotorcyclesPageState extends State<ListMotorcyclesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MotorcycleBloc>(context).add(GetListMotorcyclesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Listado de motos'),
      ),
      body: const ListMotorcyclesOrganism(),
    );
  }
}
