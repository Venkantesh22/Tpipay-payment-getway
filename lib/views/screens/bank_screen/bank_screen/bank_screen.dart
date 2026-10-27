import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/screens/bank_screen/add_new_bank_screen/add_new_bank_screen.dart';
import 'package:vlr/views/screens/bank_screen/bank_screen/widget/bank_widget.dart';
import 'package:vlr/views/widget/appbar/appbar2.dart';

class BankScreen extends StatelessWidget {
  const BankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: const AppBar2(title: "Bank Accounts"),
        bottomNavigationBar: Padding(
          padding: AppConstants.screenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                radius: 12.r,
                onTap: () {
                  navigate(context: context, page: const AddNewBankScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: white,
                      size: 18.sp,
                    ),
                    sizedBoxWidth(width: 6),
                    CustomText(
                      "Add New Bank Account",
                      style: Helper(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 15.sp,
                            color: white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: AppConstants.screenPadding,
          child: Column(
            children: [
              bankBanner(context),
              sizedBoxHeight(height: 16),
              Expanded(
                  child: ListView.separated(
                itemBuilder: (context, index) {
                  return const BankWidget();
                },
                separatorBuilder: (_, __) => sizedBoxHeight(height: 14.h),
                itemCount: 6,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              ))
            ],
          ),
        ),
      );
    });
  }

  Container bankBanner(BuildContext context) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: context.containerDecoration,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: context.primaryColorWithTheme.withValues(alpha: 0.10),
              ),
              child: Icon(
                Icons.account_balance_rounded,
                color: context.primaryColorWithTheme,
              ),
            ),
            sizedBoxWidth(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Your bank accounts",
                    style: Helper(context).textTheme.titleSmall?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  CustomText(
                    "Manage your bank accounts to receive settlements and payouts.",
                    overflow: TextOverflow.clip,
                    style: Helper(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: context.greyText,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
