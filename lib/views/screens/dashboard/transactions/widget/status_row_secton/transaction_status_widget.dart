import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final bool isSelected = transactionStatusModel.isSelect;

    return Container(
      height: 32.h,
      width: 90.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isSelected ? primaryColor : borderColor,
          width: 1,
        ),
      ),
      child: CustomText(
        transactionStatusModel.title,
        style: Helper(context).textTheme.bodyLarge?.copyWith(
          fontSize: 14.sp,
          color: isSelected ? white : greyText,
        ),
      ),
    );
  }
}

class TransactionStatusModel {
  final String title;
  bool isSelect;

  TransactionStatusModel({
    required this.title,
    this.isSelect = false,
  });
}

List<TransactionStatusModel> transactionStatusModelList = [
  TransactionStatusModel(title: "All", isSelect: true),
  TransactionStatusModel(title: "Success"),
  TransactionStatusModel(title: "Pending"),
  TransactionStatusModel(title: "Failed"),
  TransactionStatusModel(title: "Refund"),
];