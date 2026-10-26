import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: context.containerDecoration,
      child: Row(
        children: [
          Container(
            height: 56.h,
            width: 56.w,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: BoxBorder.all(
                  width: 1,
                  color: context.isDarkMode
                      ? context.primaryColor
                      : context.greyDart),
            ),
            child: const CustomImage(
              path: Assets.imagesNoProfile,
              isProfile: true,
            ),
          ),
          sizedBoxWidth(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "Rahul Patra",
                style: Helper(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 18.sp),
              ),
              sizedBoxHeight(height: 2.h),
              CustomText(
                "Wallet Balance",
                style: Helper(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12.sp, color: context.greyText),
              ),
              sizedBoxHeight(height: 2.h),
              CustomText(
                "₹48,250.00",
                style: Helper(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 20.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
