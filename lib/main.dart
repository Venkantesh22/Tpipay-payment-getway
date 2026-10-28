import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:toastification/toastification.dart';

import 'package:vlr/services/constants.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/action_screen/app_setting_screen/theme_settings_screen/widget/app_theme_preference.dart';
import 'package:vlr/views/screens/auth_screens/login_screen.dart';
import 'package:vlr/views/screens/auth_screens/opt_verification_screen.dart';
import 'package:vlr/views/screens/auth_screens/register_screen.dart';
import 'package:vlr/views/screens/dashboard/dashboard_screen.dart';

import 'services/init.dart';
import 'views/screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Init().initialize();

  // Load the saved theme before showing the app.
  await AppThemePreference.load();

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Future<void> initPlatForm() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.none);

    OneSignal.initialize(
      'appId', // Replace with your OneSignal App ID.
    );

    OneSignal.User.pushSubscription.optIn();

    await OneSignal.consentRequired(true);

    OneSignal.Notifications.addForegroundWillDisplayListener(
      (OSNotificationWillDisplayEvent event) {
        event.preventDefault();
        event.notification.display();
      },
    );

    OneSignal.Notifications.addClickListener(
      (OSNotificationClickEvent result) {
        // TODO: Handle notification click.
      },
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    initPlatForm();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    log('Current state = $state');
  }

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
        designSize: const Size(432.0, 960.0),
        minTextAdapt: true,
        builder: (context, child) {
          // Listen for changes to the user's selected theme.
          return ValueListenableBuilder<ThemeMode>(
            valueListenable: AppThemePreference.themeModeNotifier,
            builder: (context, selectedThemeMode, _) {
              return MaterialApp(
                title: AppConstants.appName,
                navigatorKey: navigatorKey,
                theme: CustomTheme.light,
                darkTheme: CustomTheme.dark,

                // Apply the currently selected theme.
                themeMode: selectedThemeMode,

                debugShowCheckedModeBanner: false,
                home: child,
              );
            },
          );
        },

        // Keep your existing home screen.
        // child: const DashboardScreen(),

        // Other screens for testing:
        // child: const LoginScreen(),
        child: const SplashScreen(),
        // child: const OtpVerificationScreen(
        //   otpSendOn: "1234567890",
        // ),
        // child: const RegisterScreen(),
      ),
    );
  }
}

// | Property              | Use         |
// | --------------------- | ----------- |
// | Width                 | `100.w`     |
// | Height                | `50.h`      |
// | Font Size             | `14.sp`     |
// | Border Radius         | `12.r`      |
// | Icon Size             | `24.sp`     |
// | Border Width          | `1` (fixed) |
// | Divider Thickness     | `1` (fixed) |
// | Horizontal Padding    | `16.w`      |
// | Vertical Padding      | `12.h`      |
// | Margin Left/Right     | `16.w`      |
// | Margin Top/Bottom     | `12.h`      |
// | Square Padding/Margin | `12.w`      |
