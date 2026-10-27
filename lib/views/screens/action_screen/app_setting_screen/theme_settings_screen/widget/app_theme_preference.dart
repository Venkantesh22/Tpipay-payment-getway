import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemePreference {
  static const String _themeModeKey = 'app_theme_mode';

  // Notifies MaterialApp when the theme changes.
  static final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.dark);

  static Future<ThemeMode> load() async {
    final prefs = await SharedPreferences.getInstance();

    final String? savedMode = prefs.getString(_themeModeKey);

    final ThemeMode mode;

    switch (savedMode) {
      case 'light':
        mode = ThemeMode.light;
        break;

      case 'dark':
        mode = ThemeMode.dark;
        break;

      case 'system':
        mode = ThemeMode.system;
        break;

      default:
        mode = ThemeMode.dark;
    }

    themeModeNotifier.value = mode;

    return mode;
  }

  static Future<void> save(ThemeMode mode) async {
    // Update the app theme immediately.
    themeModeNotifier.value = mode;

    final prefs = await SharedPreferences.getInstance();

    String value;

    switch (mode) {
      case ThemeMode.light:
        value = 'light';
        break;

      case ThemeMode.dark:
        value = 'dark';
        break;

      case ThemeMode.system:
        value = 'system';
        break;
    }

    await prefs.setString(_themeModeKey, value);
  }
}
