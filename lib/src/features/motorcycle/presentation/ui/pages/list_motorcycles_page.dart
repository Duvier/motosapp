import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motosapp/src/shared/ui/molecules/scaffold.dart';

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
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const ScaffoldMolecule(
      body: ListMotorcyclesOrganism(),
    );
  }
}
