import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                height: 60.h,
                width: 60.w,
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
                  sizedBoxHeight(height: 2),
                  CustomText(
                    "rahul@example.com",
                    style: Helper(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: context.greyText,
                        ),
                  ),
                ],
              )
            ],
          ),
          sizedBoxHeight(height: 14),
          CustomButton(
            onTap: () {},
            type: ButtonType.secondary,
            borderColor: context.primaryColorText,
            radius: 20.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit_outlined,
                  size: 18.sp,
                  color: context.primaryColorText,
                ),
                sizedBoxWidth(width: 8),
                CustomText(
                  "Edit Profile",
                  overflow: TextOverflow.clip,
                  style: Helper(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 12.sp,
                        color: context.primaryColorText,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
