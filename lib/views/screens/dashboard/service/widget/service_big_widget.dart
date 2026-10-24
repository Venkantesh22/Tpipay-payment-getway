import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/row_service_section/service_widget.dart';

class ServiceBigWidget extends StatelessWidget {
  final int index;
  const ServiceBigWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: containerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceWidget(
                index: index,
                showName: false,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: grey,
              )
            ],
          ),
          sizedBoxHeight(height: 24.h),
          CustomText(
            "Dynamic QR",
            style:
                Helper(context).textTheme.titleSmall?.copyWith(fontSize: 14.sp),
          ),
          sizedBoxHeight(height: 3.h),
          CustomText(
            "Generate and share QR for payments Generate and share QR",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Helper(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 11.sp, color: greyText),
          ),
        ],
      ),
    );
  }
}
