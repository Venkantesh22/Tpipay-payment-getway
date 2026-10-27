import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/recent_transaction_section/transaction_status_widget.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          "Transaction Details",
          overflow: TextOverflow.clip,
          style: Helper(context).textTheme.titleSmall?.copyWith(
                fontSize: 18.sp,
              ),
        ),
        actions: [
          const Icon(
            Icons.share_outlined,
          ),
          sizedBoxWidth(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Center(
          child: Column(
            children: [
              sizedBoxHeight(height: 40),
              CustomImage(
                path: Assets.imagesCheckSuccess,
                height: 70.h,
                width: 79.w,
              ),
              sizedBoxHeight(height: 18),
              TransactionStatusWidget(
                status: TransactionStatus.success,
                fontSize: 12.sp,
              ),
              sizedBoxHeight(height: 16),
              CustomText(
                "1,250",
                style: Helper(context).textTheme.titleLarge?.copyWith(
                      fontSize: 32.sp,
                    ),
              ),
              CustomText(
                "10 Oct 2025, 10:24 AM",
                style: Helper(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      color: context.greyText,
                    ),
              ),
              sizedBoxHeight(height: 12),
              _customerDetailsWidget(context),
              sizedBoxHeight(height: 14),
              paymentDetailsWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Container paymentDetailsWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: context.containerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "Payment Details",
            style: Helper(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          sizedBoxHeight(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Payment ID",
                    style: Helper(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: context.greyText,
                        ),
                  ),
                  CustomText(
                    "UPI",
                    style: Helper(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Container _customerDetailsWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: context.containerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "Customer Details",
            style: Helper(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          sizedBoxHeight(height: 12),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: grey,
                  ),
                ),
                child: CustomImage(
                  path: Assets.imagesNoProfile,
                  height: 49.h,
                  width: 49.w,
                ),
              ),
              sizedBoxWidth(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Rahul Sharma",
                      style: Helper(context).textTheme.titleSmall?.copyWith(
                            fontSize: 14.sp,
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
                    CustomText(
                      "+91 98765 43210",
                      style: Helper(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            color: context.greyText,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
