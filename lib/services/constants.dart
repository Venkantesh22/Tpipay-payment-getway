// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vlr/main.dart';
import 'package:vlr/services/route_helper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class PriceConverter {
  static String convert(dynamic price) {
    if (price == null) return '₹ 0.00';
    String cleanPrice = price.toString().replaceAll(',', '');
    double val = double.tryParse(cleanPrice) ?? 0.0;
    return '₹ ${val.toStringAsFixed(2)}';
  }

  static String convertRound(dynamic price) {
    if (price == null) return '₹ 0';
    String cleanPrice = price.toString().replaceAll(',', '');
    double val = double.tryParse(cleanPrice) ?? 0.0;
    return '₹ ${val.toInt()}';
  }

  static String convertToNumberFormat(dynamic price) {
    if (price == null) return '₹ 0.00';
    num val = num.tryParse(price.toString().replaceAll(',', '')) ?? 0;
    final format = NumberFormat("#,##,##,##0.00", "en_IN");
    return '₹ ${format.format(val)}';
  }
}

Widget sizedBoxHeight({required double height}) {
  return SizedBox(
    height: height.h,
  );
}

Widget sizedBoxWidth({required double width}) {
  return SizedBox(
    width: width.w,
  );
}

class Helper {
  final BuildContext context;
  Helper(this.context);

  Size get size => MediaQuery.sizeOf(context);
  TextTheme get textTheme => Theme.of(context).textTheme;
}

String capitalize(String? s) {
  if (s == null || s.isEmpty) return "";
  return s[0].toUpperCase() + s.substring(1);
}

void navigate({
  PageTransitionType type = PageTransitionType.fade,
  required BuildContext context,
  required Widget page,
  bool isReplace = false,
  bool isRemoveUntil = false,
  Duration duration = const Duration(milliseconds: 300),
}) {
  if (isReplace) {
    Navigator.of(context).pushReplacement(
      getCustomRoute(
        child: page,
        type: type,
        duration: duration,
      ),
    );
  } else if (isRemoveUntil) {
    Navigator.of(context).pushAndRemoveUntil(
      getCustomRoute(
        child: page,
        type: type,
        duration: duration,
      ),
      (route) => false,
    );
  } else {
    Navigator.of(context).push(
      getCustomRoute(
        child: page,
        type: type,
        duration: duration,
      ),
    );
  }
}

void pop(BuildContext context, {dynamic data}) {
  Navigator.pop(context, data);
}

enum ToastType {
  info(ToastificationType.info),
  warning(ToastificationType.warning),
  error(ToastificationType.error),
  success(ToastificationType.success);

  const ToastType(this.value);
  final ToastificationType value;
}

void showToast({
  ToastType? toastType,
  required String message,
  String? description,
  ToastificationStyle? toastificationStyle,
  bool? typeCheck,
}) {
  final context = navigatorKey.currentContext;

  if (context == null) return;

  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  final isDark = theme.brightness == Brightness.dark;

  final resolvedType = toastType?.value ??
      ((typeCheck ?? false)
          ? ToastificationType.success
          : ToastificationType.error);

  // Select the accent color and icon according to toast type.
  late final Color accentColor;
  late final IconData iconData;

  if (resolvedType == ToastificationType.success) {
    accentColor = isDark ? const Color(0xFF4ADE80) : const Color(0xFF16A34A);
    iconData = Icons.check_circle_outline_rounded;
  } else if (resolvedType == ToastificationType.error) {
    accentColor = colorScheme.error;
    iconData = Icons.error_outline_rounded;
  } else if (resolvedType == ToastificationType.warning) {
    accentColor = isDark ? const Color(0xFFFBBF24) : const Color(0xFFF59E0B);
    iconData = Icons.warning_amber_rounded;
  } else {
    accentColor = colorScheme.primary;
    iconData = Icons.info_outline_rounded;
  }

  toastification.show(
    context: context,
    alignment: Alignment.topLeft,
    type: resolvedType,

    // Adapt the toast to the active theme.
    style: toastificationStyle ?? ToastificationStyle.minimal,
    backgroundColor: colorScheme.surface,
    foregroundColor: colorScheme.onSurface,
    primaryColor: accentColor,

    borderSide: BorderSide(
      color: colorScheme.outlineVariant,
    ),
    borderRadius: BorderRadius.circular(12),

    boxShadow: [
      BoxShadow(
        color: theme.shadowColor.withValues(
          alpha: isDark ? 0.25 : 0.08,
        ),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],

    title: Text(
      message,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),

    description: description != null
        ? Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          )
        : null,

    icon: Icon(
      iconData,
      color: accentColor,
    ),

    autoCloseDuration: const Duration(seconds: 2),
  );
}

String getStringFromList(List<dynamic>? data) {
  String str = data.toString();
  return data.toString().substring(1, str.length - 1);
}

class AppConstants {
  String get getBaseUrl => baseUrl;
  set setBaseUrl(String url) => baseUrl = url;

  static String baseUrl = 'https://app.feetrack.in/api';

  static String appNameFirstHalf = 'Tpipay';
  static String appNameSecondHalf = '';

  static String appName = '$appNameFirstHalf $appNameSecondHalf';

  static String subTitle = 'Payment Gateways';

  static const String dashboard = '/hrms/dashboard';

  // Auth
  static const String registrationPost = '/partner/register';

  // container
  static const double horizontalPadding = 16;
  static const double verticalPadding = 20;
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
      horizontal: AppConstants.horizontalPadding,
      vertical: AppConstants.verticalPadding);

  // Shared Key
  static const String token = 'user_app_token';
  static const String userId = 'user_app_id';
  static const String razorpayKey = 'razorpay_key';
  static const String recentOrders = 'recent_orders';
  static const String isUser = 'is_user';
  static const String fcmToken = 'fcmToken';
}
