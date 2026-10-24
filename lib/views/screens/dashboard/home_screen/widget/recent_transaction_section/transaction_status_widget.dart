import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';

enum TransactionStatus {
  success,
  pending,
  fail,
  refund,
}

class TransactionStatusWidget extends StatelessWidget {
  final TransactionStatus status;
  const TransactionStatusWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case TransactionStatus.success:
        return _successTransaction(context);
      case TransactionStatus.pending:
        return _pendingTransaction(context);
      case TransactionStatus.fail:
        return _failedTransaction(context);
      case TransactionStatus.refund:
        return _refundTransaction(context);

    }
  }

  Container _successTransaction(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: successColor.withValues(alpha: 0.2),
      ),
      child: CustomText(
        "Success",
        style: Helper(context).textTheme.titleSmall?.copyWith(
              fontSize: 10.sp,
              color: successColor,
            ),
      ),
    );
  }
  Widget _pendingTransaction(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: warningColor.withValues(alpha: 0.2),
      ),
      child: CustomText(
        "Pending",
        style: Helper(context).textTheme.titleSmall?.copyWith(
              fontSize: 10.sp,
              color: warningColor,
            ),
      ),
    );
  }
  Widget _failedTransaction(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: errorColor.withValues(alpha: 0.2),
      ),
      child: CustomText(
        "Failed",
        style: Helper(context).textTheme.titleSmall?.copyWith(
              fontSize: 10.sp,
              color: errorColor,
            ),
      ),
    );
  }
  Widget _refundTransaction(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: refundColor.withValues(alpha: 0.2),
      ),
      child: CustomText(
        "Refund",
        style: Helper(context).textTheme.titleSmall?.copyWith(
              fontSize: 10.sp,
              color: refundColor,
            ),
      ),
    );
  }
    
}
