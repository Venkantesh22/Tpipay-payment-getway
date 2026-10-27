import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/bank_screen/bank_screen/bank_screen.dart';

class AccountWidget extends StatelessWidget {
  final AccountWidgetModel accountWidgetModel;
  const AccountWidget({
    super.key,
    required this.accountWidgetModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: context.primaryColorText.withValues(alpha: 0.10),
          ),
          padding: EdgeInsets.all(8.w),
          child: Icon(
            accountWidgetModel.iconData,
            color: context.primaryColorText,
            size: 20.sp,
          ),
        ),
        sizedBoxWidth(width: 12),
        Expanded(
          child: CustomText(
            accountWidgetModel.title,
            overflow: TextOverflow.clip,
            style: Helper(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
        ),
        accountWidgetModel.lastWidget ??
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18.sp,
            )
      ],
    );
  }
}

class AccountWidgetModel {
  final IconData iconData;
  final String title;
  final Function() onTap;
  final Widget? lastWidget;

  AccountWidgetModel(
      {required this.iconData,
      required this.title,
      required this.onTap,
      this.lastWidget});
}

List<AccountWidgetModel> accountWidgetModelList(
        {required BuildContext context}) =>
    [
      AccountWidgetModel(
          iconData: Icons.account_balance,
          title: "Bank Accounts",
          onTap: () {
            navigate(context: context, page: const BankScreen());
          }),
      AccountWidgetModel(
          iconData: Icons.edit_document,
          title: "Company Documents",
          onTap: () {}),
      AccountWidgetModel(
          iconData: Icons.security, title: "KYC Verification", onTap: () {}),
      AccountWidgetModel(
          iconData: Icons.business_center,
          title: "Business Details",
          onTap: () {}),
    ];

List<AccountWidgetModel> supportWidgetModelList = [
  AccountWidgetModel(
      iconData: Icons.support_agent_sharp,
      title: "Help & Support",
      onTap: () {}),
  AccountWidgetModel(
      iconData: Icons.policy, title: "Terms & Conditions", onTap: () {}),
  AccountWidgetModel(
      iconData: Icons.privacy_tip, title: "Privacy Policy", onTap: () {}),
  // AccountWidgetModel(
  //     iconData: Icons.business_center, title: "Business Details", onTap: () {}),
];
