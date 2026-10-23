import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// =========================================================
// THEME MODE
// =========================================================

bool get _isDark =>
    WidgetsBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;
// =========================================================
// BRAND COLORS
// =========================================================

const Color primaryPurple = Color(0xFF8614B8);
const Color navyColor = Color(0xFF17105F);
const Color lightPurple = Color(0xFFF5EEFC);
const Color softPurple = Color(0xFFE9D7F6);
const Color accentPurple = Color(0xFFB66AE0);

// Transaction and account status colors.
const Color successColor = Color(0xFF168451);
const Color warningColor = Color(0xFFB7791F);
const Color errorColor = Color(0xFFD14343);
const Color infoColor = Color(0xFF3478D4);
const Color refundColor = Color(0xFF7C3AED);

// =========================================================
// GENERAL THEME COLORS
// =========================================================

Color get primaryColor => primaryPurple;

Color get primaryColorWithTheme => primaryColor;

Color get whiteColorWithTheme => surfaceColor;

Color get tertiaryColor =>
    _isDark ? const Color(0xFFB8A1FF) : const Color(0xFF6D28D9);

Color get secondaryColor => _isDark ? const Color(0xFF342641) : lightPurple;

Color get backgroundLight => appBackground;

Color get appBackground =>
    _isDark ? const Color(0xFF0C0D22) : const Color(0xFFFAF9FD);

Color get surfaceColor => _isDark ? const Color(0xFF19152F) : Colors.white;

Color get cardColor => _isDark ? const Color(0xFF211C3D) : Colors.white;

Color get inputBackgroundColor =>
    _isDark ? const Color(0xFF211C3D) : const Color(0xFFFCFBFE);

Color get borderColor =>
    _isDark ? const Color(0xFF393251) : const Color(0xFFE7E1F0);

const Color black = Colors.black;
const Color white = Colors.white;

Color blackTheme = _isDark ? Colors.white : Colors.black;
Color whiteTheme = _isDark ? Colors.black : Colors.white;

// =========================================================
// TEXT COLORS
// =========================================================

Color get textPrimary => _isDark ? const Color(0xFFF8F5FF) : navyColor;
Color get primaryColorText => _isDark ? const Color(0xFFB832E8) : primaryColor;

Color get textSecondary =>
    _isDark ? const Color(0xFFB9B2D0) : const Color(0xFF77728D);


Color get greyDarkText =>
    _isDark ? const Color(0xFF9892BA) : const Color(0xFF687282);

Color get greyText =>
    _isDark ? const Color(0xFF94A3B8) : const Color(0xFF687282);

Color get blackText1 =>
    _isDark ? const Color(0xFFE8E2F5) : const Color(0xFF334155);





// =========================================================
// GREY AND NEUTRAL COLORS
// =========================================================

Color get grey => _isDark ? const Color(0xFFA8A0BD) : const Color(0xFF999999);

Color get grey1 => _isDark ? const Color(0xFF6D657F) : const Color(0xFF999999);

Color get greyLight =>
    _isDark ? const Color(0xFF252038) : const Color(0xFFF6F3F9);

Color get greyLight1 =>
    _isDark ? const Color(0xFF20203B) : const Color(0xFFEFF6FF);

Color get greyLight2 =>
    _isDark ? const Color(0xFF393251) : const Color(0xFFC3C6D1);

Color get greyLight3 =>
    _isDark ? const Color(0xFF29313E) : const Color(0xFFEBE7E7);

Color get greyLight4 =>
    _isDark ? const Color(0xFF20203B) : const Color(0xFFF1F5F9);

Color get greyLight5 =>
    _isDark ? const Color(0xFFA8A0BD) : const Color(0xFF94A3B8);

Color get greyLight6 =>
    _isDark ? const Color(0xFF393251) : const Color(0xFFC3C6D7);

Color get greyLight7 =>
    _isDark ? const Color(0xFF202033) : const Color(0xFFF3F4F6);

Color get greyLight8 =>
    _isDark ? const Color(0xFFB9B2D0) : const Color(0xFF64748B);

// =========================================================
// PURPLE AND BLUE ACCENTS
// =========================================================

Color get purple => primaryColor;

Color get purpleLight => _isDark ? const Color(0xFF342641) : lightPurple;

Color get purple2 => _isDark ? accentPurple : const Color(0xFF9333EA);

Color get deepPurple =>
    _isDark ? const Color(0xFFC4A5E8) : const Color(0xFF6200A3);

Color get blueLight3 =>
    _isDark ? const Color(0xFF9DBEFF) : const Color(0xFF003DA6);

Color get blueDark2 =>
    _isDark ? const Color(0xFFB8C9E8) : const Color(0xFF36446E);

Color get blueDark1 =>
    _isDark ? const Color(0xFF8AB4FF) : const Color(0xFF1E40AF);

Color get textBlue =>
    _isDark ? const Color(0xFF9DBEFF) : const Color(0xFF003B73);

Color get defaultColor => tertiaryColor;

// =========================================================
// STATUS COLORS
// Used by transaction details and account verification.
// =========================================================

Color get green => _isDark ? const Color(0xFF6EE7B7) : const Color(0xFF006C49);

Color get green2 => _isDark ? const Color(0xFF4ADE80) : const Color(0xFF0E9A41);

Color get greenDark =>
    _isDark ? const Color(0xFF5EEAD4) : const Color(0xFF006A61);

Color get greenDark1 => greenDark;

Color get greenDark2 =>
    _isDark ? const Color(0xFF86EFAC) : const Color(0xFF1E7E34);

Color get greenLight =>
    _isDark ? const Color(0xFF86EFAC) : const Color(0xFF108548);

Color get greenLight1 => greenLight;

Color get yellow => _isDark ? const Color(0xFFFBBF24) : const Color(0xFFF59E0B);

Color get goldColor => const Color(0xFFFFB400);

Color get organ => const Color(0xFFF97316);

Color get red => _isDark ? const Color(0xFFFF8A80) : const Color(0xFFDC2626);

Color get red1 => _isDark ? const Color(0xFFFF8FAB) : const Color(0xFFE11D48);

Color get redDark =>
    _isDark ? const Color(0xFFFF8A80) : const Color(0xFFBA1A1A);

Color get pinkLight =>
    _isDark ? const Color(0xFF342731) : const Color(0xFFFBF1F2);

Color get pinkLight2 =>
    _isDark ? const Color(0xFF3B302B) : const Color(0xFFFFEDD5);

// =========================================================
// INPUT, DIVIDER AND SHIMMER COLORS
// =========================================================

Color get textBox =>
    _isDark ? const Color(0xFF29223D) : primaryPurple.withValues(alpha: 0.05);

Color get dividerColor =>
    _isDark ? const Color(0xFF393251) : const Color(0xFFE7E1F0);

Color get dividerColor1 =>
    _isDark ? const Color(0xFF29243D) : const Color(0xFFF1EDF6);

Color get shimmerBase =>
    _isDark ? const Color(0xFF2A253D) : const Color(0xFFEBEBF4);

Color get shimmerHighlight =>
    _isDark ? const Color(0xFF3A334F) : const Color(0xFFF4F4F8);

// =========================================================
// CONTAINER DECORATIONS
// Use these getters in reusable cards and sections.
// =========================================================

Color get containerBg => cardColor;

// =========================================================
// Button Linear Gradient
// =========================================================
LinearGradient buttonGradient = _isDark
    ? const LinearGradient(
        colors: [
          Color(0xFF9C33F7),
          Color(0xFF612EFB),
        ],
        begin: AlignmentGeometry.centerLeft,
        end: AlignmentGeometry.centerRight,
      )
    : const LinearGradient(
        colors: [Color(0xFF6B1CB0), Color(0xFF5213B3), Color(0xFF3A0B9E)],
        begin: AlignmentGeometry.centerLeft,
        end: AlignmentGeometry.centerRight,
      );

BoxDecoration get darkThemeContainerDecoration => BoxDecoration(
      color: containerBg,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(
        width: 1,
        color: Colors.white.withValues(alpha: 0.06),
      ),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 12,
          spreadRadius: -4,
          color: Colors.black.withValues(alpha: 0.20),
        ),
      ],
    );

BoxDecoration get containerDecoration => BoxDecoration(
      color: containerBg,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(
        width: 1,
        color: borderColor,
      ),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 12,
          spreadRadius: -5,
          color: Colors.black.withValues(
            alpha: _isDark ? 0.15 : 0.05,
          ),
        ),
      ],
    );

BoxDecoration get primaryGradientDecoration => BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF8614B8),
          Color(0xFF17105F),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16.r),
    );

BoxDecoration get softPurpleDecoration => BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: borderColor),
    );

BoxDecoration get outlinedContainerDecoration => BoxDecoration(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
        color: borderColor,
        width: 1,
      ),
    );

// Status decorations.
BoxDecoration get successDecoration => BoxDecoration(
      color: successColor.withValues(alpha: _isDark ? 0.18 : 0.08),
      borderRadius: BorderRadius.circular(10.r),
    );

BoxDecoration get pendingDecoration => BoxDecoration(
      color: warningColor.withValues(alpha: _isDark ? 0.18 : 0.08),
      borderRadius: BorderRadius.circular(10.r),
    );

BoxDecoration get failedDecoration => BoxDecoration(
      color: errorColor.withValues(alpha: _isDark ? 0.18 : 0.08),
      borderRadius: BorderRadius.circular(10.r),
    );

BoxDecoration get refundDecoration => BoxDecoration(
      color: refundColor.withValues(alpha: _isDark ? 0.18 : 0.08),
      borderRadius: BorderRadius.circular(10.r),
    );

// =========================================================
// MATERIAL COLOR SWATCH
// =========================================================

const Map<int, Color> color = <int, Color>{
  50: Color(0xFFF5E7FB),
  100: Color(0xFFE8C8F5),
  200: Color(0xFFD9A4EC),
  300: Color(0xFFC67CE0),
  400: Color(0xFFB45ED2),
  500: Color(0xFF8614B8),
  600: Color(0xFF7610A3),
  700: Color(0xFF620C89),
  800: Color(0xFF4D086F),
  900: Color(0xFF35044F),
};

const MaterialColor colorCustom = MaterialColor(
  0xFF8614B8,
  color,
);

// =========================================================
// CUSTOM THEME DATA
// =========================================================

class CustomTheme {
  CustomTheme._();

  static final ThemeData light = _buildTheme(Brightness.light);
  static final ThemeData dark = _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    final Color background = isDark
        ? const Color(0xFF0C0D22)
        // ? const Color(0xFF100D25)
        : const Color(0xFFFAF9FD);

    final Color surface = isDark ? const Color(0xFF19152F) : Colors.white;

    final Color card =
        isDark ? const Color(0xFF211C3D) : const Color(0xFFFBFBFF);

    final Color border =
        isDark ? const Color(0xFF393251) : const Color(0xFFDFDEF2);

    final Color primaryText = isDark ? const Color(0xFFF8F5FF) : navyColor;

    final Color secondaryTextColor =
        isDark ? const Color(0xFFB9B2D0) : const Color(0xFF77728D);

    final Color secondary = isDark ? const Color(0xFF342641) : lightPurple;

    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: primaryPurple,
      brightness: brightness,
    ).copyWith(
      primary: primaryPurple,
      onPrimary: Colors.white,
      secondary: isDark ? accentPurple : navyColor,
      onSecondary: Colors.white,
      error: isDark ? const Color(0xFFFF8A80) : errorColor,
      onError: Colors.white,
      surface: surface,
      onSurface: primaryText,
      outline: border,
      outlineVariant: border,
      surfaceContainerHighest: card,
    );

    final TextTheme baseTextTheme = GoogleFonts.manropeTextTheme(
      ThemeData(
        brightness: brightness,
        useMaterial3: true,
      ).textTheme,
    ).apply(
      bodyColor: primaryText,
      displayColor: primaryText,
    );

    // Montserrat for headings, Manrope for body text.
    // ScreenUtil scales font sizes using the device's design size.
    final TextTheme textTheme = baseTextTheme.copyWith(
      displayLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w800,
        color: primaryText,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w800,
        color: primaryText,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      headlineLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w800,
        color: primaryText,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w900,
        color: primaryText,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w800,
        color: primaryText,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontWeight: FontWeight.w500,
        color: primaryText,
      ),
      bodySmall: GoogleFonts.manrope(
        fontWeight: FontWeight.w400,
        color: secondaryTextColor,
      ),
      labelLarge: GoogleFonts.manrope(
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      labelMedium: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        color: secondaryTextColor,
      ),
      labelSmall: GoogleFonts.manrope(
        fontWeight: FontWeight.w500,
        color: secondaryTextColor,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      primaryColor: primaryPurple,
      primaryColorLight: softPurple,
      primaryColorDark: navyColor,
      primarySwatch: colorCustom,
      scaffoldBackgroundColor: background,
      canvasColor: surface,
      cardColor: card,
      dividerColor: border,
      shadowColor: Colors.black.withValues(
        alpha: isDark ? 0.24 : 0.06,
      ),
      splashColor: primaryPurple.withValues(alpha: 0.08),
      hintColor: secondaryTextColor,
      fontFamily: GoogleFonts.manrope().fontFamily,
      textTheme: textTheme,

      // General icons.
      iconTheme: IconThemeData(
        color: primaryText,
        size: 22.sp,
      ),

      // App bar and system bars.
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: primaryText,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: primaryText,
          size: 23.sp,
        ),
        actionsIconTheme: IconThemeData(
          color: primaryText,
          size: 23.sp,
        ),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: primaryText,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: surface,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness: brightness,
          systemNavigationBarColor: surface,
          systemNavigationBarIconBrightness:
              isDark ? Brightness.light : Brightness.dark,
        ),
      ),

      // Cards.
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
          side: BorderSide(color: border),
        ),
      ),

      // Dividers.
      dividerTheme: DividerThemeData(
        color: border,
        thickness: 1,
        space: 1,
      ),

      // Inputs, text fields and forms.
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF211C3D) : const Color(0xFFFCFBFE),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: secondaryTextColor,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: secondaryTextColor,
        ),
        floatingLabelStyle: textTheme.bodyMedium?.copyWith(
          color: isDark ? accentPurple : primaryPurple,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(
            color: primaryPurple,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(
            color: errorColor,
            width: 1.5,
          ),
        ),
      ),

      // Elevated buttons.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          disabledBackgroundColor:
              isDark ? const Color(0xFF393251) : const Color(0xFFE7E1F0),
          disabledForegroundColor: secondaryTextColor,
          elevation: 0,
          minimumSize: Size.fromHeight(52.h),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 14.h,
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ),

      // Filled buttons.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          minimumSize: Size.fromHeight(52.h),
          textStyle: textTheme.labelLarge?.copyWith(
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ),

      // Outlined buttons.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: isDark ? accentPurple : primaryPurple,
          side: BorderSide(
            color: isDark ? accentPurple : primaryPurple,
          ),
          minimumSize: Size.fromHeight(50.h),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 14.h,
          ),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ),

      // Text buttons.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: isDark ? accentPurple : primaryPurple,
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),

      // Icon buttons.
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: primaryText,
        ),
      ),

      // Floating action buttons.
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
      ),

      // Chips.
      chipTheme: ChipThemeData(
        backgroundColor: secondary,
        selectedColor: primaryPurple.withValues(alpha: 0.15),
        disabledColor: card,
        labelStyle: textTheme.labelMedium!,
        side: BorderSide(color: border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),

      // Checkboxes.
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return primaryPurple;
            }
            return null;
          },
        ),
        checkColor: const WidgetStatePropertyAll<Color>(
          Colors.white,
        ),
        side: BorderSide(color: border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),

      // Radio buttons.
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return primaryPurple;
            }
            return secondaryTextColor;
          },
        ),
      ),

      // Switches.
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return secondaryTextColor;
          },
        ),
        trackColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return primaryPurple;
            }
            return border;
          },
        ),
      ),

      // Bottom navigation.
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primaryPurple,
        unselectedItemColor: secondaryTextColor,
        selectedLabelStyle: textTheme.labelSmall?.copyWith(
          color: primaryPurple,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: textTheme.labelSmall,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // Material 3 navigation.
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: primaryPurple.withValues(alpha: 0.13),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (states) {
            final bool selected = states.contains(WidgetState.selected);

            return textTheme.labelSmall?.copyWith(
              color: selected ? primaryPurple : secondaryTextColor,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            );
          },
        ),
      ),

      // Tabs.
      tabBarTheme: TabBarThemeData(
        labelColor: primaryPurple,
        unselectedLabelColor: secondaryTextColor,
        labelStyle: textTheme.labelLarge,
        unselectedLabelStyle: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        indicatorColor: primaryPurple,
        dividerColor: border,
      ),

      // List tiles.
      listTileTheme: ListTileThemeData(
        iconColor: isDark ? accentPurple : primaryPurple,
        textColor: primaryText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 4.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),

      // Dialogs.
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),

      // Bottom sheets.
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        modalBackgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.r),
          ),
        ),
      ),

      // Snack bars.
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? const Color(0xFF302747) : navyColor,
        contentTextStyle: GoogleFonts.manrope(
          color: Colors.white,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),

      // Loading indicators.
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryPurple,
        linearTrackColor: secondary,
      ),

      // Tooltips.
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: isDark ? card : navyColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        textStyle: GoogleFonts.manrope(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),

      // Scrollbars.
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll<Color>(
          primaryPurple.withValues(alpha: 0.45),
        ),
        radius: Radius.circular(10.r),
      ),

      // Text selection.
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryPurple,
        selectionColor: Color(0x338614B8),
        selectionHandleColor: primaryPurple,
      ),
    );
  }
}
