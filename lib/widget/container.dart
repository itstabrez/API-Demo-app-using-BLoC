import 'package:flutter/material.dart';

class ContainerWidget {
  static Widget containerList({
    double? height,
    double? width,
    Color? backgroundColor,
    EdgeInsets? margin,
    double? border,
    final Widget? child,
  }) {
    return Container(
      height: height ?? 70,
      width: width ?? 70,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(),
      ),
      child: child,
    );
  }
}
