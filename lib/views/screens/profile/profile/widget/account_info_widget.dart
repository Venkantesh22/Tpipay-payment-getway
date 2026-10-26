import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';

class AccountInfoWidget extends StatelessWidget {
  final AccountInfoWidgetModel accountInfoWidgetModel;
  const AccountInfoWidget({
    super.key,
    required this.accountInfoWidgetModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: context.primaryColorText.withValues(alpha: 0.10)),
          child: Icon(
            accountInfoWidgetModel.iconData,
            size: 18.sp,
            color: context.primaryColorText,
          ),
        ),
        sizedBoxWidth(width: 12),
        Expanded(
          child: CustomText(
            accountInfoWidgetModel.title,
            style: Helper(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13.sp,
                  color: context.greyText,
                ),
          ),
        ),
        accountInfoWidgetModel.subTitle != null
            ? Expanded(
                child: CustomText(
                  textAlign: TextAlign.end,
                  maxLines: 4,
                  overflow: TextOverflow.clip,
                  accountInfoWidgetModel.subTitle ?? "",
                  style: Helper(context).textTheme.titleSmall?.copyWith(
                        fontSize: 13.sp,
                      ),
                ),
              )
            : accountInfoWidgetModel.lastWidget ?? const SizedBox(),
      ],
    );
  }
}

class AccountInfoWidgetModel {
  final IconData iconData;
  final String title;
  final String? subTitle;
  final Widget? lastWidget;

  AccountInfoWidgetModel(
      {required this.iconData,
      required this.title,
      this.subTitle,
      this.lastWidget});
}

List<AccountInfoWidgetModel> accountInfoWidgetModelList(BuildContext context) =>
    [
      AccountInfoWidgetModel(
          iconData: Icons.person_outline,
          title: "Full Name",
          subTitle: "Rahul Patra"),
      AccountInfoWidgetModel(
          iconData: Icons.email_outlined,
          title: "Email",
          subTitle: "rahul@example.com"),
      AccountInfoWidgetModel(
          iconData: Icons.phone_outlined,
          title: "Mobile Number",
          subTitle: "+91 98765 43210"),
      AccountInfoWidgetModel(
          iconData: Icons.business,
          title: "Company Name",
          subTitle: "Patra Enterprises  "),
      AccountInfoWidgetModel(
          iconData: Icons.credit_card,
          title: "Merchant ID",
          subTitle: "TPIPAY123456"),
      AccountInfoWidgetModel(
        iconData: Icons.security,
        title: "KYC Status",
        lastWidget: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          decoration: BoxDecoration(
              color: context.green.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12.r)),
          child: CustomText(
            "Verified",
            overflow: TextOverflow.clip,
            style: Helper(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 12.sp, color: context.green),
          ),
        ),
      ),
      AccountInfoWidgetModel(
        iconData: Icons.manage_accounts,
        title: "Account Status",
        lastWidget: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          decoration: BoxDecoration(
              color: context.green.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12.r)),
          child: CustomText(
            "Active",
            overflow: TextOverflow.clip,
            style: Helper(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 12.sp, color: context.green),
          ),
        ),
      ),
    ];

List<AccountInfoWidgetModel> accountInfoUpdateWidgetModelList(
        BuildContext context) =>
    [
      AccountInfoWidgetModel(
          iconData: Icons.person_outline,
          title: "Full Name",
          subTitle: "Rahul Patra"),
      AccountInfoWidgetModel(
          iconData: Icons.email_outlined,
          title: "Email",
          subTitle: "rahul@example.com"),
      AccountInfoWidgetModel(
          iconData: Icons.phone_outlined,
          title: "Mobile Number",
          subTitle: "+91 98765 43210"),
      AccountInfoWidgetModel(
          iconData: Icons.business,
          title: "Company Name",
          subTitle: "Patra Enterprises  "),
      AccountInfoWidgetModel(
          iconData: Icons.credit_card,
          title: "Merchant ID",
          subTitle: "TPIPAY123456"),
      AccountInfoWidgetModel(
        iconData: Icons.security,
        title: "KYC Status",
        lastWidget: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          decoration: BoxDecoration(
              color: context.green.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12.r)),
          child: CustomText(
            "Verified",
            overflow: TextOverflow.clip,
            style: Helper(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 12.sp, color: context.green),
          ),
        ),
      ),
      AccountInfoWidgetModel(
        iconData: Icons.manage_accounts,
        title: "Account Status",
        lastWidget: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          decoration: BoxDecoration(
              color: context.green.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12.r)),
          child: CustomText(
            "Active",
            overflow: TextOverflow.clip,
            style: Helper(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 12.sp, color: context.green),
          ),
        ),
      ),
    ];
