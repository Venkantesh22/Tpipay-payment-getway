import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/appbar_widget.dart';
import 'package:vlr/views/screens/dashboard/transactions/widget/search_bar_and_filter_section/search_bar_and_filter_section.dart';
import 'package:vlr/views/screens/dashboard/transactions/widget/status_row_secton/status_row_secton.dart';
import 'package:vlr/views/screens/dashboard/transactions/widget/transaction_list_section.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
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
                    color: context.greyText,
                  ),
            ),
            sizedBoxHeight(height: 20.h),
            const StatusRowSection(),
            sizedBoxHeight(height: 20.h),
            const SearchBarAndFilterSection(),
            sizedBoxHeight(height: 28.h),
            const Expanded(child: TransactionListSection())
          ],
        ),
      ),
    );
  }
}
