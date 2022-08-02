import 'package:flutter/material.dart';

import '../../../routes/nested_screen.dart';
import '../../utils/navigate.dart';
// import '../app_colors.dart';
import '../navigator_keys.dart';
import 'app_bar.dart';
import 'bottom_bar.dart';

class ScaffoldMolecule extends StatelessWidget {
  const ScaffoldMolecule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      appBar: const AppBarMolecule(title: 'Motosapp'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateTo(NavigatorKeys.bottomNavigationBarFirstItem.currentContext ?? context, 'add_motorcycle'),
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: NestedScreen(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBarMolecule(),
    );
  }
}
