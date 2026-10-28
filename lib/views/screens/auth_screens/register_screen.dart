import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:vlr/views/screens/auth_screens/login_screen.dart';
import 'package:vlr/views/screens/auth_screens/opt_verification_screen.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        bottomNavigationBar: const Padding(
          padding: AppConstants.screenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        ),
        body: SingleChildScrollView(
          padding: AppConstants.screenPadding,
          child: Center(
            child: GetBuilder<AuthController>(builder: (authController) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sizedBoxHeight(height: 40),
                  CustomImage(
                    path: context.imageAppLogoWithName,
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 1.5,
                    fit: BoxFit.fitWidth,
                  ),
                  sizedBoxHeight(height: 24),
                  CustomText(
                    "Create Your Account",
                    style: Helper(context).textTheme.titleSmall?.copyWith(
                          fontSize: 27.sp,
                        ),
                  ),
                  sizedBoxHeight(height: 8),
                  CustomText(
                    "Register now and start accepting\npayments with TpiPay.",
                    textAlign: TextAlign.center,
                    style: Helper(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.5.sp, color: context.greyDarkText),
                  ),
                  sizedBoxHeight(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFieldWithHeading(
                          controller: authController.firstNameController,
                          preFixWidget: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SvgPicture.asset(Assets.svgsPerson),
                          ),
                          hindText: "First Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      sizedBoxWidth(width: 12),
                      Expanded(
                        child: AppTextFieldWithHeading(
                          controller: authController.firstNameController,
                          preFixWidget: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SvgPicture.asset(Assets.svgsPerson),
                          ),
                          hindText: "Last Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight(height: 12),
                  AppTextFieldWithHeading(
                    controller: authController.companyNameController,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(Assets.svgsCompany),
                    ),
                    hindText: "Company Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                  ),
                  sizedBoxHeight(height: 12),
                  AppTextFieldWithHeading(
                    controller: authController.emailController,
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
                  sizedBoxHeight(height: 12),
                  AppTextFieldWithHeading(
                    controller: authController.mobileController,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(Assets.svgsPhone),
                    ),
                    hindText: "Mobile Number",
                    keyboardType: TextInputType.phone, //
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, //
                      LengthLimitingTextInputFormatter(10), //
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }

                      if (value.length < 10) {
                        return 'Please enter a valid 10-digit mobile number';
                      }

                      return null;
                    },
                  ),
                  sizedBoxHeight(height: 12),
                  AppTextFieldWithHeading(
                    controller: authController.passwordController,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(Assets.svgsLock),
                    ),
                    obscureText: true,
                    hindText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  sizedBoxHeight(height: 12),
                  AppTextFieldWithHeading(
                    controller: authController.confirmPasswordController,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(Assets.svgsLock),
                    ),
                    hindText: "Confirm password",
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your confirm password';
                      }
                      if (value != authController.passwordController.text) {
                        return 'Confirm do not match with password';
                      }
                      return null;
                    },
                  ),
                  sizedBoxHeight(height: 16),
                  CustomButton(
                    height: 65.h,
                    radius: 16.r,
                    gradient: context.buttonGradient,
                    onTap: () {
                      if (authController.isLoading) {
                        return showToast(message: "Please wait..");
                      }
                      navigate(
                          context: context,
                          page: const OtpVerificationScreen(
                              otpSendOn: "+91 1234567890"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "Create Account",
                          textAlign: TextAlign.center,
                          style: Helper(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 16.sp,
                                color: white,
                              ),
                        ),
                        sizedBoxWidth(width: 16),
                        const Icon(
                          Icons.arrow_forward,
                          color: white,
                        )
                      ],
                    ),
                  ),
                  sizedBoxHeight(height: 18),
                  CustomText(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                    style: Helper(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.5.sp, color: context.greyDarkText),
                  ),
                  CustomButton(
                    onTap: () {
                      if (authController.isLoading) {
                        return showToast(message: "Please wait..");
                      }
                      navigate(context: context, page: const LoginScreen());
                    },
                    type: ButtonType.tertiary,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: context
                                .primaryColorText, // Set your desired color
                          ),
                        ),
                      ),
                      child: CustomText(
                        "Login Now",
                        textAlign: TextAlign.center,
                        style: Helper(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14.5.sp,
                            color: context.primaryColorText,
                            textBaseline: TextBaseline.ideographic),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
