// ignore_for_file: strict_top_level_inference

import 'package:movies/core/responsive/dimentions.dart';

extension Extentions on num {
  get h => Dimentions.deviceHeightPercentage() * this;
  get w => Dimentions.deviceWidthPercentage() * this;

  get sp => Dimentions.deviceShortestSidePercentage() * this;
  get r => Dimentions.deviceShortestSidePercentage() * this;
}
