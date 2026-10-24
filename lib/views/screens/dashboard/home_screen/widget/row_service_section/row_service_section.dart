import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/dashboard_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/widget/view_all_widget/view_all_widget.dart';

class RowOfServiceSection extends StatelessWidget {
  const RowOfServiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              "Quick Services",
              style: Helper(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 14.sp),
            ),
            ViewAllWidget(onTap: () {
              Get.find<DashBoardController>().dashPage = 1;
            })
          ],
        ),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 64.h,
                      width: 64.w,
                      padding: EdgeInsets.all(16.w),
                      decoration: serviceContainerDecoration(index: index),
                      child: SvgPicture.asset(
                        Assets.svgsDynamicQr,
                        colorFilter: ColorFilter.mode(
                          serviceAccentColor(index),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    sizedBoxHeight(height: 5),
                    CustomText(
                      "Dynamic Qr",
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: Helper(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14.sp),
                    )
                  ],
                );
              },
              separatorBuilder: (_, __) => sizedBoxWidth(width: 26),
              itemCount: 10),
        ),
      ],
    );
  }
}
