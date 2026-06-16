import 'package:flutter/material.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      centerTitle: true,
      title: CustomText(text: text, color: AppColors.textPrimary),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.bookmark_outline, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
