import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/auth_controller.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/screens/auth_screens/register_screen.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<AuthController>(
        builder: (authController) {
          return Padding(
            padding: AppConstants.screenPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  "Don’t have an account?",
                  textAlign: TextAlign.center,
                  style: Helper(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14.5.sp, color: greyDarkText),
                ),
                CustomButton(
                  onTap: () {
                      if (authController.isLoading) {
                        return showToast(message: "Please wait..");
                      }
                      navigate(context: context, page: const RegisterScreen());
                  },
                  type: ButtonType.tertiary,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: primaryColorText, // Set your desired color
                        ),
                      ),
                    ),
                    child: CustomText(
                      "Register Now",
                      textAlign: TextAlign.center,
                      style: Helper(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14.5.sp,
                          color: primaryColorText,
                          textBaseline: TextBaseline.ideographic),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Center(
          child: GetBuilder<AuthController>(builder: (authController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizedBoxHeight(height: 80),
                CustomImage(
                  path: context.imageAppLogoWithName,
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 1.5,
                  fit: BoxFit.fitWidth,
                ),
                sizedBoxHeight(height: 24),
                CustomText(
                  "Welcome Back!",
                  style: Helper(context).textTheme.titleSmall?.copyWith(
                        fontSize: 27.sp,
                      ),
                ),
                sizedBoxHeight(height: 8),
                CustomText(
                  "Login to your merchant account\nand manage your business.",
                  textAlign: TextAlign.center,
                  style: Helper(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14.5.sp, color: greyDarkText),
                ),
                sizedBoxHeight(height: 32),
                AppTextFieldWithHeading(
                  controller: authController.passwordController,
                  preFixWidget: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SvgPicture.asset(Assets.svgsEmail),
                  ),
                  hindText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }

                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);

                    if (!emailValid) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),
                sizedBoxHeight(height: 16),
                AppTextFieldWithHeading(
                  controller: authController.emailController,
                  obscureText: true,
                  preFixWidget: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SvgPicture.asset(Assets.svgsLock),
                  ),
                  hindText: "Password",
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                sizedBoxHeight(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      type: ButtonType.tertiary,
                      onTap: () {},
                      child: CustomText(
                        "Forgot Password?",
                        textAlign: TextAlign.center,
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13.5.sp, color: primaryColorText),
                      ),
                    )
                  ],
                ),
                sizedBoxHeight(height: 12),
                CustomButton(
                  height: 65.h,
                  radius: 16.r,
                  gradient: buttonGradient,
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "Login",
                        textAlign: TextAlign.center,
                        style: Helper(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 16.sp, color: whiteTheme),
                      ),
                      sizedBoxWidth(width: 16),
                      Icon(
                        Icons.arrow_forward,
                        color: whiteTheme,
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
