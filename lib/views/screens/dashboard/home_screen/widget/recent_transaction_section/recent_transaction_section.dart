import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/dashboard_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/recent_transaction_section/transaction_short_widget.dart';
import 'package:vlr/views/widget/view_all_widget/view_all_widget.dart';

class RecentTransactionsSection extends StatelessWidget {
  const RecentTransactionsSection({
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
              "Recent Transactions",
              style: Helper(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 16.sp),
            ),
            ViewAllWidget(
              onTap: () {
                Get.find<DashBoardController>().dashPage = 2;
              },
              title: "See All",
            )
          ],
        ),
        sizedBoxHeight(height: 12),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const TransactionShotWidget();
            },
            separatorBuilder: (_, __) {
              return sizedBoxHeight(height: 24.h);
            },
            itemCount: 10)
      ],
    );
  }
}
