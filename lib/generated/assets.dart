// ignore_for_file: prefer_single_quotes
import 'package:flutter/material.dart';

class Assets {
  Assets._();
  
  /// Assets for imagesLogo
  static const String imagesLogo = "assets/images/logo.png";

  /// Assets for imagesLogoName
  static const String imagesLogoName = "assets/images/logo-name.png";

  /// Assets for imagesLogoNameWobg
  static const String imagesLogoNameWobg = "assets/images/logo-name-wobg.png";

  /// Assets for imagesLogoWobg
  static const String imagesLogoWobg = "assets/images/logo-wobg.png";

  /// Assets for imagesNoProfile
  static const String imagesNoProfile = "assets/images/no-profile.png";

  /// Assets for imagesPlaceholder
  static const String imagesPlaceholder = "assets/images/placeholder.jpg";

  /// Assets for imagesShimmer
  static const String imagesShimmer = "assets/images/shimmer.gif";

  /// Assets for imagesSplachImage
  static const String imagesSplachImage = "assets/images/splach-image.png";

  /// Assets for imagesSplashImageDart
  static const String imagesSplashImageDart = "assets/images/splash-image-dart.png";

  /// Assets for svgsHome
  static const String svgsHome = "assets/svgs/home.svg";
}

// =========================================================
// GLOBAL THEME HELPERS
// =========================================================

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

