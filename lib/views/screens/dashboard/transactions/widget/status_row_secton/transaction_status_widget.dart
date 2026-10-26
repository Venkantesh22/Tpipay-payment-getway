import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vlr/controllers/transaction_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/services/custom_text.dart';

class TransactionStatusWidget extends StatelessWidget {
  final TransactionStatusModel transactionStatusModel;

  const TransactionStatusWidget({
    super.key,
    required this.transactionStatusModel,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(builder: (transactionController) {
      final bool isSelected = transactionStatusModel.id ==
          transactionController.selectTransactionStatus;

      return Container(
        height: 32.h,
        width: 90.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? context.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? context.primaryColor : context.borderColor,
            width: 1,
          ),
        ),
        child: CustomText(
          transactionStatusModel.title,
          style: Helper(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14.sp,
                color: isSelected ? white : context.greyText,
              ),
        ),
      );
    });
  }
}

class TransactionStatusModel {
  final int id;
  final String title;

  TransactionStatusModel({
    required this.title,
    required this.id,
  });
}
