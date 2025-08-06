import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  // final themeController = Get.put(ThemeController());
  // static const Color primaryColor = Color(0xff2F4F2F);
  static Color get primaryColor =>
      Get.isDarkMode ? const Color(0xFF121212) : const Color(0xff2F4F2F);
  static const Color containerColor = Color(0xffE6F1D4);
  // static const Color backgroundColor = Color(0xfff5f5dc);
  static Color get backgroundColor =>
      Get.isDarkMode ? Colors.black : Color(0xfff5f5dc);
  static const Color whiteColor = Color(0xffffffff);
  // static const Color blackColor = Color(0xff000000);
  static Color get blackColor =>
      Get.isDarkMode ? const Color(0xff000000) : const Color(0xff000000);

  static const Color iconColor = Color(0xffE6DFBE);
  static const Color pokemonContainerColor = Color(0xffE6DFBE8C);
}
