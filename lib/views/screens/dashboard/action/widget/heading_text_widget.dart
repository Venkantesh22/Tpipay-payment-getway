import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';

class HeadingTextWidget extends StatelessWidget {
  final String title;
  const HeadingTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title,
      overflow: TextOverflow.clip,
      style: Helper(context).textTheme.titleSmall?.copyWith(
            fontSize: 15.sp,
          ),
    );
  }
}
