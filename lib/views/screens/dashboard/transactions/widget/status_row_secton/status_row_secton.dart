import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/screens/dashboard/transactions/widget/status_row_secton/transaction_status_widget.dart';

class StatusRowSection extends StatefulWidget {
  const StatusRowSection({super.key});

  @override
  State<StatusRowSection> createState() => _StatusRowSectionState();
}

class _StatusRowSectionState extends State<StatusRowSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final transactionStatusModel = transactionStatusModelList[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                for (int i = 0; i < transactionStatusModelList.length; i++) {
                  transactionStatusModelList[i].isSelect = i == index;
                }
              });
            },
            child: TransactionStatusWidget(
              transactionStatusModel: transactionStatusModel,
            ),
          );
        },
        separatorBuilder: (_, __) => sizedBoxWidth(width: 8.w),
        itemCount: transactionStatusModelList.length,
      ),
    );
  }
}