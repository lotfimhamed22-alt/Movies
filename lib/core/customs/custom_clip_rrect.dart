import 'package:flutter/material.dart';
import 'package:movies/core/responsive/extentions.dart';

class CustomClipRrect extends StatelessWidget {
  const CustomClipRrect({super.key, required this.imgPath});
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(30.r),
      child: Image.network(
        imgPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
      ),
    );
  }
}
