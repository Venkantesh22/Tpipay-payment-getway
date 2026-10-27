import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';

class BankWidget extends StatelessWidget {
  const BankWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _bankWidget(
        context: context, isActive: true, showButton: true, isPrimary: true);
  }

  Container _bankWidget({
    required BuildContext context,
    bool isActive = false,
    bool showButton = false,
    isPrimary = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: context.containerDecoration,
      child: Column(
        children: [
          Row(
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
                    isPrimary ? _primaryWidget(context) : const SizedBox(),
                    sizedBoxHeight(height: 2),
                    CustomText(
                      "HDFC Bank",
                      style: Helper(context).textTheme.titleSmall?.copyWith(
                            fontSize: 15.sp,
                          ),
                    ),
                    CustomText(
                      "Rahul Patra",
                      style: Helper(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12.sp, color: context.greyText),
                    ),
                    CustomText(
                      "**** **** 3233",
                      style: Helper(context).textTheme.titleSmall?.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.greyText,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Divider(
              color: context.dividerColor,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  "IFSC: HDFC0001234",
                  style: Helper(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12.sp, color: context.greyText),
                ),
              ),
              isActive ? _activeWidget(context) : const SizedBox(),
              sizedBoxWidth(width: 10),
              showButton
                  ? CustomButton(
                      onTap: () => _showPrimaryBottomSheet(context),
                      height: 35.h,
                      radius: 20.r,
                      color: context.primaryColorText.withValues(alpha: 0.10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: CustomText(
                          "Primary",
                          style: Helper(context).textTheme.titleSmall?.copyWith(
                                fontSize: 12.sp,
                                color: context.primaryColorText,
                              ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }

  void _showPrimaryBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: context.greyTheme,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                sizedBoxHeight(height: 24),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: context.primaryColorText.withValues(
                      alpha: 0.10,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Icon(
                    Icons.account_balance_rounded,
                    size: 32.sp,
                    color: context.primaryColorText,
                  ),
                ),
                sizedBoxHeight(height: 16),
                CustomText(
                  "Set as Primary Account",
                  style: Helper(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
                sizedBoxHeight(height: 8),
                CustomText(
                  "Do you want to make your HDFC Bank account "
                  "the primary account for transactions?",
                  overflow: TextOverflow.clip,
                  style: Helper(context).textTheme.bodyMedium?.copyWith(
                        color: context.greyText,
                      ),
                  textAlign: TextAlign.center,
                ),
                sizedBoxHeight(height: 24),
                _bankWidget(context: context),
                sizedBoxHeight(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pop(bottomSheetContext);

                          // TODO: Call your API to set this bank account
                          // as the primary account.
                        },
                        radius: 14.r,
                        color: context.primaryColorText,
                        child: CustomText(
                          "Confirm",
                          style: Helper(context).textTheme.titleSmall?.copyWith(
                                color: white,
                                fontSize: 15.sp,
                              ),
                        ),
                      ),
                    ),
                    sizedBoxWidth(width: 10),
                    Expanded(
                      child: CustomButton(
                        radius: 14.r,
                        type: ButtonType.secondary,
                        onTap: () {
                          Navigator.pop(bottomSheetContext);
                        },
                        borderColor: context.primaryColorWithTheme,
                        child: CustomText(
                          "Cancel",
                          style: Helper(context).textTheme.titleSmall?.copyWith(
                                color: context.primaryColorWithTheme,
                                fontSize: 14.sp,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row _activeWidget(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: context.green1,
          size: 18.sp,
        ),
        sizedBoxWidth(width: 4),
        CustomText(
          "Active",
          style: Helper(context).textTheme.bodyMedium?.copyWith(
                fontSize: 12.sp,
                color: context.green1,
              ),
        ),
      ],
    );
  }

  Container _primaryWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: context.green1.withValues(alpha: 0.10),
      ),
      child: CustomText(
        "Primary Account",
        style: Helper(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12.sp,
              color: context.green1,
            ),
      ),
    );
  }
}
