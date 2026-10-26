import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBar2({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: CustomText(
        title,
        overflow: TextOverflow.clip,
        style: Helper(context).textTheme.titleSmall?.copyWith(
              fontSize: 18.sp,
            ),
      ),
    );
  }
}
