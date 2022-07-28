import 'package:flutter/material.dart';

import '../../utils/navigate.dart';
import '../app_colors.dart';
import 'app_bar.dart';
import 'bottom_bar.dart';

class ScaffoldMolecule extends StatelessWidget {
  final Widget body;
  final String titleAppBar;
  const ScaffoldMolecule(
      {Key? key, required this.body, required this.titleAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarMolecule(title: titleAppBar),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateTo(context, 'add_motorcycle'),
        child: const Icon(Icons.add),
      ),
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBarMolecule(),
    );
  }
}