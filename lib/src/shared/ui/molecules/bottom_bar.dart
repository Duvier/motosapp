import 'package:flutter/material.dart';
import 'package:motosapp/src/shared/utils/navigate.dart';

import '../../../router/routes.dart';
import '../navigator_keys.dart';

class BottomBarMolecule extends StatelessWidget {
  const BottomBarMolecule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // color: Colors.blue,
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0, //
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 05.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 30.0,
              icon: const Icon(Icons.home),
              onPressed: () => navigateTo(
                NavigatorKeys.bottomNavigationBarFirstItem.currentContext ??
                    context,
                Routes.home,
              ),
            ),
            IconButton(
              iconSize: 30.0,
              icon: const Icon(Icons.two_wheeler),
              onPressed: () => navigateTo(
                NavigatorKeys.bottomNavigationBarFirstItem.currentContext ??
                    context,
                Routes.motorcycles,
              ),
            ),
            const SizedBox(width: 30.0),
            const IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.build),
              onPressed: null,
            ),
            const IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.person),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
