import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:vlr/controllers/auth_controller.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final authController = Get.find<AuthController>();
        authController.optController.clear();
      },
    );
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 60;
    });

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    return _secondsRemaining.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      borderRadius: BorderRadius.circular(12.r),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomImage(
          path: context.imageAppLogoWithName,
          height: 40.h,
          width: 110.w,
          fit: BoxFit.contain,
        ),
      ),
      body: GetBuilder<AuthController>(builder: (authController) {
        return SingleChildScrollView(
          padding: AppConstants.screenPadding,
          child: Center(
            child: Column(
              children: [
                CustomImage(
                  path: context.imageEnterOtp,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    sizedBoxHeight(height: 20),
                    CustomText(
                      "Enter Verification Code",
                      style: Helper(context).textTheme.titleSmall?.copyWith(
                            fontSize: 24.sp,
                          ),
                    ),
                    sizedBoxHeight(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      text: TextSpan(
                          text:
                              "We have sent a 6-digit verification code to your email address",
                          style: Helper(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                                color: context.greyText,
                              ),
                          children: [
                            TextSpan(
                              text: authController.emailController.text,
                              style:
                                  Helper(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: 14.sp,
                                      ),
                            ),
                          ]),
                    ),
                    sizedBoxHeight(height: 28),
                    Center(
                      child: Pinput(
                        length: 6, // Creates 6 boxes
                        controller: authController.optController,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        keyboardType: TextInputType.number,
                        onCompleted: (pin) {
                          // Optional: Automatically trigger verification when all 6 digits are entered
                          print("Entered OTP: $pin");
                        },
                      ),
                    ),
                    sizedBoxHeight(height: 32),
                    Center(
                      child: _secondsRemaining > 0
                          ? CustomText(
                              "Resend OTP in 00:$_formattedTime",
                              style: Helper(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                    color: context.greyDarkText,
                                  ),
                            )
                          : GestureDetector(
                              onTap: () {
                                // TODO: Add Resend API Logic
                                _startTimer();
                              },
                              child: CustomText(
                                "Didn't receive the code? Resend",
                                style: Helper(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: context.greyDarkText,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                    ),
                    sizedBoxHeight(height: 20),
                    CustomButton(
                      height: 65.h,
                      radius: 16.r,
                      gradient: context.buttonGradient,
                      onTap: () {
                        if (authController.isLoading) {
                          return showToast(message: "Please wait..");
                        }
                        // navigate(
                        //     context: context, page: const DashboardScreen());
                      },
                      child: CustomText(
                        "Verify OTP",
                        textAlign: TextAlign.center,
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16.sp,
                              color: white,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 24.h,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: context.dividerColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: CustomText(
                              "or",
                              style: Helper(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: context.dividerColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      height: 65.h,
                      radius: 16.r,
                      type: ButtonType.secondary,
                      borderColor: context.primaryColorText,
                      onTap: () {
                        if (authController.isLoading) {
                          return showToast(message: "Please wait..");
                        }
                        pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: context.primaryColorText,
                            size: 18.sp,
                          ),
                          sizedBoxWidth(width: 8),
                          CustomText(
                            "Back to Enter Email",
                            textAlign: TextAlign.center,
                            style:
                                Helper(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: 14.sp,
                                      color: context.primaryColorText,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
