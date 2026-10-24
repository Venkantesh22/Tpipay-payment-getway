
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vlr/controllers/transaction_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/appbar_widget.dart';
import 'package:vlr/views/screens/dashboard/transactions/widget/status_row_secton/status_row_secton.dart';
import 'package:vlr/views/screens/dashboard/transactions/widget/transaction_list_section.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

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
              "Transactions",
              style: Helper(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 24.sp),
            ),
            sizedBoxHeight(height: 4.h),
            CustomText(
              "View and manage all your transactions.",
              overflow: TextOverflow.clip,
              style: Helper(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: greyText,
                  ),
            ),
            sizedBoxHeight(height: 20.h),
            const StatusRowSection(),
            sizedBoxHeight(height: 20.h),
            searchBarAndFilterButton(),
            sizedBoxHeight(height: 28.h),
           const  Expanded(child: TransactionListSection())
          ],
        ),
      ),
    );
  }

  Widget searchBarAndFilterButton() =>
      GetBuilder<TransactionController>(builder: (transactionController) {
        return Row(
          children: [
            Expanded(
              child: AppTextFieldWithHeading(
                controller: transactionController.transactionSearchController,
                hindText: "Search by name, ID or amount...",
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value){
                 
                },
                preFixWidget: Icon(
                  Icons.search,
                  color: grey,
                  size: 18.sp,
                ),
              ),
            ),
            sizedBoxWidth(width: 10),
            Container(
              height: 56.h,
              width: 56.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: borderColor),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Icon(
                Icons.filter_list_rounded,
                color: grey,
                size: 30.sp,
              ),
            )
          ],
        );
      });
}
