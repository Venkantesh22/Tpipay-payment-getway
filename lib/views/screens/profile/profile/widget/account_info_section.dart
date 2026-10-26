import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/profile/profile/widget/account_info_widget.dart';

class AccountInfoSection extends StatelessWidget {
  const AccountInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = accountInfoWidgetModelList(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: context.containerDecoration,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final accountInfoWidgetModel = list[index];
          return AccountInfoWidget(
            accountInfoWidgetModel: accountInfoWidgetModel,
          );
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
          ),
        ),
        itemCount: list.length,
      ),
    );
  }
}
