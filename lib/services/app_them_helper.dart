
// =========================================================
// GLOBAL THEME HELPERS
// =========================================================

import 'package:flutter/material.dart';
import 'package:vlr/generated/assets.dart';

extension AppGlobals on BuildContext {
  // Current active Flutter theme
  bool get isDarkMode =>
      Theme.of(this).brightness == Brightness.dark;

  bool get isLightMode => !isDarkMode;

  String get splashImage =>
      isDarkMode ? Assets.imagesSplashImageDart : Assets.imagesSplachImage;

  String get imageAppLogoWithName=>
      isDarkMode ? Assets.imagesLogoNameWobg : Assets.imagesLogoNameWobg;

  String get imageAppLogo=>
      isDarkMode ? Assets.imagesLogoWobg : Assets.imagesLogoWobg;
 

  // Theme-aware colors
  Color get primaryAppColor =>
      Theme.of(this).colorScheme.primary;

  Color get appBackgroundColor =>
      Theme.of(this).scaffoldBackgroundColor;

  Color get appTextColor =>
      Theme.of(this).colorScheme.onSurface;

  Color get appCardColor =>
      Theme.of(this).cardColor;
}

