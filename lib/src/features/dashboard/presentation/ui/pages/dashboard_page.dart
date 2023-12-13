import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/ui/molecules/scaffold.dart';
import '../../../../motorcycle/presentation/bloc/motorcycle_bloc.dart';
import '../organisms/dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
      body: SafeArea(
        child: DashboardOrganism(),
      ),
    );
  }
}
