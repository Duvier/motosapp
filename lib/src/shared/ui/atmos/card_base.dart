import 'package:flutter/material.dart';

class CardBaseAtom extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color;
  const CardBaseAtom({Key? key, required this.child, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 2.5),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 80.0,
        width: double.maxFinite,
        child: child,
      ),
    );
  }
}
