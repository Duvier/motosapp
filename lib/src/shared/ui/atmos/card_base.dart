import 'package:flutter/material.dart';
import 'package:motosapp/src/shared/ui/app_colors.dart';

class CardBaseAtom extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color;
  final double? height;
  final EdgeInsets? padding;
  const CardBaseAtom({
    Key? key,
    required this.child,
    this.onTap,
    this.color,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.card,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 2.5),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: height,
        width: double.maxFinite,
        child: child,
      ),
    );
  }
}
