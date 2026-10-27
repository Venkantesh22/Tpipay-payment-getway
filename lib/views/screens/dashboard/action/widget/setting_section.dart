import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/action/widget/account_widget.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = settingWidgetModelList(context: context);
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: context.containerDecoration,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            AccountWidgetModel accountWidgetModel = list[index];
            return GestureDetector(
                onTap: accountWidgetModel.onTap,
                child: AccountWidget(accountWidgetModel: accountWidgetModel));
          },
          separatorBuilder: (_, __) => sizedBoxHeight(height: 24),
          itemCount: list.length),
    );
  }
}
