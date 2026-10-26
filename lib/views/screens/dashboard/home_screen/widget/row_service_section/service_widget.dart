import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';

class ServiceWidget extends StatelessWidget {
  final int index;
  final bool showName;
  const ServiceWidget({
    super.key,
    required this.index,
    this.showName = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64.h,
          width: 64.w,
          padding: EdgeInsets.all(16.w),
          decoration: context.serviceContainerDecoration(index: index),
          child: SvgPicture.asset(
            Assets.svgsDynamicQr,
            colorFilter: ColorFilter.mode(
              context.serviceAccentColor(index),
              BlendMode.srcIn,
            ),
          ),
        ),
        showName
            ? Column(
                children: [
                  sizedBoxHeight(height: 5),
                  CustomText(
                    "Dynamic Qr",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: Helper(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 14.sp),
                  ),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
