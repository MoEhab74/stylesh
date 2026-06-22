import 'package:flutter/material.dart';

class AppBarIconWidget extends StatelessWidget {
  const AppBarIconWidget({
    super.key,
    this.padding,
    this.constraints,
    this.hoverColor,
    required this.icon,
    this.onPressed,
  });
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final Color? hoverColor;
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      constraints: constraints,
      hoverColor: hoverColor,
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      icon: icon,
      onPressed: onPressed ?? () {},
    );
  }
}
