import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/auth_screens/login_screen.dart';

import '../../../services/constants.dart';
import '../../base/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();


         Timer(const Duration(seconds: 2), () {
        
          // if (Get.find<SharedPreferences>().getBool(AppConstants.isFirstVisit) ?? true) {
          //   Navigator.pushReplacement(
          //     context,
          //     getCustomRoute(
          //       child: const IntroScreen(),
          //     ),
          //   );
          // } else {
            navigate(context: context, page: LoginScreen());
          // }
        });

//    Get.find<BasicController>().fetchSettings().then((value) async {
//       if (value.isSuccess) {
//         PackageInfo info = await PackageInfo.fromPlatform();
//         log(info.buildNumber, name: 'Build Number');
//         log(info.version, name: 'Version');

//         if ((Platform.isIOS ? Get.find<BasicController>().settings?.iosAppVersion : Get.find<BasicController>().settings?.appVersion).toInt > info.buildNumber.toInt) {
//           if (!mounted) return;
//           await showUpdateDialogue(
//             context: context,
//             skip: (Platform.isAndroid
//                 ? (Get.find<BasicController>().settings?.forceUpdate != 'on')
//                 : (Get.find<BasicController>().settings?.iosForceUpdate != 'on')),
//           );
//         } else if ((Platform.isAndroid ? Get.find<BasicController>().settings?.maintenanceMode : Get.find<BasicController>().settings?.iosMaintenanceMode) == 'on') {
//           if (!mounted) return;
//           await showMaintenanceDialog(
//             context: context,
//           );
//         }

//         // Without Login Explore
//         Timer(const Duration(seconds: 2), () {
//           if (Get.find<AuthController>().isLoggedIn()) Get.find<AuthController>().getUserProfileData();
//           if (Get.find<SharedPreferences>().getBool(AppConstants.isFirstVisit) ?? true) {
//             Navigator.pushReplacement(
//               context,
//               getCustomRoute(
//                 child: const IntroScreen(),
//               ),
//             );
//           } else {
//             Navigator.pushReplacement(
//               context,
//               getCustomRoute(
//                 child: const DashboardScreen(),
//               ),
//             );
//           }
//         });

//       } else {
//         showCustomToast(msg: value.data?.toString() ?? 'Something Went Wrong');
//       }
//     });

    Timer.run(() {
      Future.delayed(const Duration(seconds: 2), () {});
      /*if (Get.find<AuthController>().isLoggedIn()) {
        Get.find<AuthController>().getUserProfileData().then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            if (Get.find<AuthController>().checkUserData()) {
              Navigator.pushReplacement(
                context,
                getMaterialRoute(
                  child: const Dashboard(),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                getMaterialRoute(
                  child: const SignupScreen(),
                ),
              );
            }
          });
        });
      } else {
        Navigator.pushReplacement(
          context,
          getMaterialRoute(
            child: const LoginScreen(),
          ),
        );
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                sizedBoxHeight(height: MediaQuery.of(context).size.height / 4.8),
                CustomImage(
                  path: context.imageAppLogoWithName,
                  fit: BoxFit.cover,
                  height: 100.h,
                ),
                sizedBoxHeight(height: 20),
                CustomText(
                  'Payments Made Easy\nfor Your Business',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: Helper(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 19.sp),
                ),
                const Spacer(),
                CustomImage(
                  path: context.splashImage,
                  height:  MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                sizedBoxHeight(height: 30),
                const CircularProgressIndicator(),
                sizedBoxHeight(height: 50),
              ],
            ),
            Positioned(
              left: -260,
             top:  -260,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width:
                    MediaQuery.of(context).size.height / 2, 
                decoration:  BoxDecoration(
                  color:   context.isDarkMode ? const Color(0xFF281D6E).withValues(alpha: 0.5) :  primaryColorWithTheme.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -100,
             top:  -100,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width:
                    MediaQuery.of(context).size.height / 3.5, 
                decoration:  BoxDecoration(
                  color:   context.isDarkMode ? const Color(0xFF281D6E).withValues(alpha: 0.5) :  primaryColorWithTheme.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -400,
             bottom:  -450,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width:
                    MediaQuery.of(context).size.height / 1.5, 
                decoration:  BoxDecoration(
                  color:   context.isDarkMode ? const Color(0xFF281D6E).withValues(alpha: 0.5) :  primaryColorWithTheme.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ));
  }
}
