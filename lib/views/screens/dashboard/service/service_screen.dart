import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/appbar_widget.dart';
import 'package:vlr/views/screens/dashboard/service/widget/service_big_widget.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      body: Padding(
        padding: AppConstants.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "All Services",
              style: Helper(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 24.sp),
            ),
            sizedBoxHeight(height: 4.h),
            CustomText(
              "Manage your payments and grow your business with our services.",
              overflow: TextOverflow.clip,
              style: Helper(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: greyText,
                  ),
            ),
            sizedBoxHeight(height: 20.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.1,
                  crossAxisCount: 2,
                  crossAxisSpacing:
                      14.w, 
                  mainAxisSpacing: 14.h,
                ),
                itemBuilder: (context, index) {
                  return ServiceBigWidget(index: index);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
