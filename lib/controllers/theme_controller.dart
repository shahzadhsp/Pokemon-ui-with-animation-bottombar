import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  // Load saved theme from storage or use system
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    bool? isDarkSaved = _loadThemeFromStorage();
    themeMode.value =
        isDarkSaved == null
            ? ThemeMode.system
            : (isDarkSaved ? ThemeMode.dark : ThemeMode.light);
    super.onInit();
  }

  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  void toggleTheme() {
    final isDark = !isDarkMode;
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToStorage(isDark);
    Get.changeThemeMode(themeMode.value);
  }

  bool? _loadThemeFromStorage() => _storage.read(_key);
  void _saveThemeToStorage(bool isDarkMode) => _storage.write(_key, isDarkMode);
}
