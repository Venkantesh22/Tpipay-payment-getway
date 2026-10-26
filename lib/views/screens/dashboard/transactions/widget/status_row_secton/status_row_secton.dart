import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vlr/controllers/transaction_controller.dart';
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
    return GetBuilder<TransactionController>(builder: (transactionController) {
      return SizedBox(
        height: 32.h,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final transactionStatusModel =
                transactionController.transactionStatusModelList[index];

            return GestureDetector(
              onTap: () {
                setState(() {
                  transactionController.updateTransactionStatus(
                      id: transactionStatusModel.id);
                });
              },
              child: TransactionStatusWidget(
                transactionStatusModel: transactionStatusModel,
              ),
            );
          },
          separatorBuilder: (_, __) => sizedBoxWidth(width: 8.w),
          itemCount: transactionController.transactionStatusModelList.length,
        ),
      );
    });
  }
}
