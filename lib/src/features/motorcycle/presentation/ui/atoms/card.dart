import 'package:flutter/material.dart';
import 'package:motosapp/src/shared/ui/app_colors.dart';

class CardAtom extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const CardAtom({Key? key, required this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.card,
      ),
      padding: padding,
      alignment: Alignment.center,
      child: child,
    );
  }
}
