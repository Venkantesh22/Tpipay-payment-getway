import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vlr/controllers/auth_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/screens/profile/edit_profile/edit_profile_screen.dart';

class ProfileShortInfoWithEditButton extends StatelessWidget {
  const ProfileShortInfoWithEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: context.containerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomImage(
                  path: Assets.imagesNoProfile,
                  isProfile: true,
                  height: 70.h,
                  width: 70.w,
                ),
                sizedBoxWidth(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Rahul Patra",
                      style: Helper(context).textTheme.titleSmall?.copyWith(
                            fontSize: 18.sp,
                          ),
                    ),
                    CustomText(
                      "Merchant Account",
                      style: Helper(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                            color: context.textPrimary,
                          ),
                    ),
                    sizedBoxHeight(height: 10),
                    SizedBox(
                      height: 30.h,
                      child: CustomButton(
                        type: ButtonType.secondary,
                        borderColor: context.primaryColorText,
                        onTap: () {
                          if (authController.isLoading) {
                            return showToast(
                                message: "Please wait..",
                                toastType: ToastType.info);
                          }
                          navigate(
                            context: context,
                            page: const EditProfileScreen(),
                          );
                        },
                        radius: 100.r,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                size: 16.sp,
                                color: context.primaryColorText,
                              ),
                              sizedBoxWidth(width: 8),
                              CustomText(
                                "Edit Profile",
                                style: Helper(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 12.sp,
                                      color: context.primaryColorText,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
