import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/auth_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/screens/profile/profile/widget/account_info_widget.dart';
import 'package:vlr/views/widget/appbar/appbar2.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = accountInfoUpdateWidgetModelList(context);

    return Scaffold(
      appBar: const AppBar2(title: "Edit profile"),
      body: GetBuilder<AuthController>(builder: (authController) {
        return SingleChildScrollView(
          padding: AppConstants.screenPadding,
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 112.h,
                      width: 112.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: context.greyDart,
                        ),
                      ),
                      child: const CustomImage(
                        path: Assets.imagesNoProfile,
                      ),
                    ),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.primaryColorText,
                            border: Border.all(
                              width: 2,
                              color: context.whiteTheme,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: context.whiteTheme,
                            size: 16.sp,
                          ),
                        ))
                  ],
                ),
                sizedBoxHeight(height: 12),
                CustomText(
                  "Tap on the camera icon to change your profile photo",
                  style: Helper(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12.sp,
                        color: context.greyText,
                      ),
                ),
                sizedBoxHeight(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFieldWithHeading(
                        controller: authController.firstNameController,
                        preFixWidget: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: SvgPicture.asset(Assets.svgsPerson),
                        ),
                        heading: "First Name",
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
                        heading: "Last Name",
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
                sizedBoxHeight(height: 27),
                Row(
                  children: [
                    CustomText(
                      "Account Information (Read Only)",
                      style: Helper(context).textTheme.titleSmall?.copyWith(
                            fontSize: 15.sp,
                          ),
                    ),
                    sizedBoxWidth(width: 8),
                    Icon(
                      Icons.info_outline,
                      size: 20.sp,
                      color: context.primaryColorText,
                    ),
                  ],
                ),
                sizedBoxHeight(height: 4),
                CustomText(
                  "Other account details cannot be edited. Please contact support if you need to update them.",
                  overflow: TextOverflow.clip,
                  style: Helper(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12.sp,
                        color: context.greyText,
                      ),
                ),
                sizedBoxHeight(height: 13),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: context.containerDecoration,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final accountInfoWidgetModel = list[index];
                      return AccountInfoWidget(
                        accountInfoWidgetModel: accountInfoWidgetModel,
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                    ),
                    itemCount: list.length,
                  ),
                ),
                sizedBoxHeight(height: 24),
                CustomButton(
                  onTap: () {},
                  radius: 20.r,
                  child: CustomText(
                    "Update Profile",
                    style: Helper(context).textTheme.titleSmall?.copyWith(
                          fontSize: 16.sp,
                          color: white,
                        ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
