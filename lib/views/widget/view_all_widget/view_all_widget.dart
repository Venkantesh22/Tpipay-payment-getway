import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';

class ViewAllWidget extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  const ViewAllWidget({super.key, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      type: ButtonType.tertiary,
      child: CustomText(
        title ?? "View All",
        style: Helper(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: 12.sp, color: context.primaryColorText),
      ),
    );
  }
}
