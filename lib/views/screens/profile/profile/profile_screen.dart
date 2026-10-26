import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/action/widget/heading_text_widget.dart';
import 'package:vlr/views/screens/profile/profile/widget/account_info_section.dart';
import 'package:vlr/views/screens/profile/profile/widget/profile_shot_info_with_edit_button.dart';
import 'package:vlr/views/widget/appbar/appbar2.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar2(
        title: "My Profile",
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileShortInfoWithEditButton(),
            sizedBoxHeight(height: 16.h),
            walletContainer(context),
            sizedBoxHeight(height: 18),
            const HeadingTextWidget(title: "Account & Verification"),
            sizedBoxHeight(height: 8),
            AccountInfoSection()
          ],
        ),
      ),
    );
  }

  Container walletContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: context.containerDecoration,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                width: 1,
                color: context.greyDart,
              ),
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: context.primaryColor,
            ),
          ),
          sizedBoxWidth(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "Wallet Balance",
                  style: Helper(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12.sp,
                        color: context.greyText,
                      ),
                ),
                CustomText(
                  "₹48,250.00",
                  style: Helper(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: context.greyText,
          ),
        ],
      ),
    );
  }
}
