import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String otpSendOn;
  const OtpVerificationScreen({super.key, required this.otpSendOn});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
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
    _otpController.dispose();
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
      appBar: AppBar(),
      body: Padding(
        padding: AppConstants.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxHeight(height: 18),
            CustomText(
              "Enter OTP",
              style: Helper(context).textTheme.titleSmall?.copyWith(
                    fontSize: 27.sp,
                  ),
            ),
            sizedBoxHeight(height: 18),
            RichText(
              text: TextSpan(
                text: "We have sent a 6-digit code to\n",
                style: Helper(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16.sp, color: context.greyDarkText),
                children: [
                  TextSpan(
                    text: widget.otpSendOn,
                    style: Helper(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 16.sp, color: context.blackTheme),
                  ),
                ],
              ),
            ),
            sizedBoxHeight(height: 60),
            Center(
              child: Pinput(
                length: 6, // Creates 6 boxes
                controller: _otpController,
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
                      style: Helper(context).textTheme.bodyMedium?.copyWith(
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
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              color: context.greyDarkText,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
