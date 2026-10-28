import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';

class SuccessfullyScreen extends StatelessWidget {
  final String buttonTitle;
  final String title;
  final String subTitle;
  final Function() onTap;
  const SuccessfullyScreen(
      {super.key,
      required this.buttonTitle,
      required this.title,
      required this.subTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: AppConstants.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              height: 65.h,
              radius: 16.r,
              gradient: context.buttonGradient,
              onTap: onTap,
              child: CustomText(
                buttonTitle,
                textAlign: TextAlign.center,
                style: Helper(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      color: white,
                    ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: CustomImage(
          path: context.imageAppLogoWithName,
          height: 40.h,
          width: 110.w,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: AppConstants.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                path: context.imageCheck,
                height: MediaQuery.of(context).size.height / 6,
              ),
              sizedBoxHeight(height: 30),
              CustomText(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: Helper(context).textTheme.titleMedium?.copyWith(
                      fontSize: 25.sp,
                    ),
              ),
              sizedBoxHeight(height: 12),
              CustomText(
                subTitle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: Helper(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14.sp, color: context.greyText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
