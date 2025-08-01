import 'package:flutter/material.dart';
import 'package:pokemon_ui/res/app_colors.dart';

class CustomBackArrowWidget extends StatelessWidget {
  const CustomBackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
          border: Border.all(color: AppColors.iconColor, width: 2),
          // Customize color as needed
        ),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.iconColor,
          size: 24,
        ),
      ),
    );
  }
}
