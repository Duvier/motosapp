import 'package:flutter/material.dart';

import '../../../router/routes.dart';
import '../../../routes/nested_screen.dart';
import '../../utils/navigate.dart';
// import '../app_colors.dart';
import '../navigator_keys.dart';
import 'app_bar.dart';
import 'bottom_bar.dart';

class ScaffoldMolecule extends StatelessWidget {
  const ScaffoldMolecule({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      appBar: const AppBarMolecule(title: 'Motosapp'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        // child: NestedScreen(),
        child: body,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateTo(
          NavigatorKeys.bottomNavigationBarFirstItem.currentContext ?? context,
          Routes.addMotorcycle,
        ),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomBarMolecule(),
    );
  }
}
