import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/asset_constants.dart';

class CustomClipRrect extends StatelessWidget {
  const CustomClipRrect({
    super.key,
    required this.imgPath,
    this.width,
    this.height,
    this.radius = 30,
    this.widthImage = 65,
    this.heightImage = 65,
  });
  final String imgPath;
  final double? width;
  final double? height;
  final double radius;

  final double? widthImage;
  final double? heightImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(radius.r),

      child: Image.network(
        imgPath,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          AssetConstants.personAsset,
          width: widthImage,
          height: heightImage,
        ),
      ),
    );
  }
}
