import 'package:flutter/material.dart';

class Dimentions {
  static final _mediaQueryData = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  );

  // percetage of height
  static double deviceHeightPercentage() {
    return _mediaQueryData.size.height / 1000;
  }

  // percetage of width
  static double deviceWidthPercentage() {
    return _mediaQueryData.size.width / 500;
  }

  // percetage of shortestSide
  static double deviceShortestSidePercentage() {
    return _mediaQueryData.size.shortestSide / 500;
  }
}
