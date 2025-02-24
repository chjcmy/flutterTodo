import 'package:flutter/material.dart';

abstract class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1000;
  static const double desktop = 1190;

  static const double bottomSheet = 600;
}

extension LayoutExt on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  T layout<T>(
    T base, {
    T? mobile,
    T? tablet,
    T? desktop,
  }) {
    if (screenSize.width < Breakpoints.mobile) {
      return mobile ?? base;
    } else if (screenSize.width < Breakpoints.tablet) {
      return tablet ?? base;
    } else {
      return desktop ?? base;
    }
  }
}
