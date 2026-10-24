import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/recent_transaction_section/transaction_status_widget.dart';

class TransactionShotWidget extends StatelessWidget {
  const TransactionShotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: green.withValues(alpha: 0.05),
              border: Border.all(
                width: 1,
                color: green.withValues(alpha: context.isDarkMode ? 0.30 :  0.10),
              )),
          child: SvgPicture.asset(
            Assets.svgsDynamicQr,
            colorFilter: ColorFilter.mode(
              green,
              BlendMode.srcIn,
            ),
          ),
        ),
        sizedBoxWidth(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "Rahul Sharma",
                style: Helper(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 14.sp),
              ),
              sizedBoxHeight(height: 5.h),
              CustomText(
                "UPI Payment • Today, 10:42 AM",
                style: Helper(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 11.sp, color: greyText),
              ),
            ],
          ),
        ),
        Column(
          children: [
            CustomText(
              "+ ₹2,500",
              style: Helper(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 14.sp),
            ),
            sizedBoxHeight(height: 5.h),
            const TransactionStatusWidget(status: TransactionStatus.success)
          ],
        )
      ],
    );
  }
}
