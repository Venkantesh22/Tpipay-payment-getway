import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/recent_transaction_section/transaction_short_widget.dart';

class TransactionListSection extends StatelessWidget {
  const TransactionListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const TransactionShotWidget();
            },
            separatorBuilder: (_, __) {
              return sizedBoxHeight(height: 26.h);
            },
            itemCount: 20);
  }
}
