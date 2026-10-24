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

  Widget _successTransaction(BuildContext context) {
    return _buildStatus(
      context,
      title: "Success",
      color: successColor,
    );
  }

  Widget _pendingTransaction(BuildContext context) {
    return _buildStatus(
      context,
      title: "Pending",
      color: warningColor,
    );
  }

  Widget _failedTransaction(BuildContext context) {
    return _buildStatus(
      context,
      title: "Failed",
      color: errorColor,
    );
  }

  Widget _refundTransaction(BuildContext context) {
    return _buildStatus(
      context,
      title: "Refund",
      color: refundColor,
    );
  }

  Widget _buildStatus(
    BuildContext context, {
    required String title,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: color.withValues(alpha: 0.1),
        border: Border.all(
          width: 1,
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: CustomText(
        title,
        style: Helper(context).textTheme.titleSmall?.copyWith(
              fontSize: 10.sp,
              color: color,
            ),
      ),
    );
  }
}