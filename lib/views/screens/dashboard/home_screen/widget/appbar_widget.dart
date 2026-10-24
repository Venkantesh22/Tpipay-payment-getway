
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/base/custom_image.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomImage(
        path: context.imageAppLogoWithName,
        height: 41.h,
        fit: BoxFit.cover,
      ),
      elevation: 2,
      actions: [
        Icon(
          Icons.notifications_none_rounded,
          size: 26.sp,
        ),
        sizedBoxWidth(width: 16.w)
      ],
    );
  }
}
