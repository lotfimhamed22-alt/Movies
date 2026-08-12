import 'package:flutter/material.dart';

class AppSized {
  static late MediaQueryData mediaQueryData;
  static void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
  }

  static double get width => mediaQueryData.size.width;
  static double get height => mediaQueryData.size.height;
}
