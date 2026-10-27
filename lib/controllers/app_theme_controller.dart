import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeController extends GetxController {
  static const String _themeKey = 'app_theme_mode';

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedThemeMode();
  }

  Future<void> _loadSavedThemeMode() async {
    final prefs = await SharedPreferences.getInstance();

    final savedMode = prefs.getString(_themeKey);

    final ThemeMode mode = ThemeMode.values.firstWhere(
      (item) => item.name == savedMode,
      orElse: () => ThemeMode.system,
    );

    themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;

    // Apply the theme immediately.
    Get.changeThemeMode(mode);

    // Save the user's choice for the next app launch.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  }
}
