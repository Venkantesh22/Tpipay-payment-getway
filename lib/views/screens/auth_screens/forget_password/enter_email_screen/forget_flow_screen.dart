import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/base/custom_image.dart';

class ForgetFlowScreen extends StatelessWidget {
  final String image;
  final Widget widget;
  const ForgetFlowScreen(
      {super.key, required this.image, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomImage(
          path: context.imageAppLogoWithName,
          height: 40.h,
          width: 110.w,
          fit: BoxFit.contain,
        ),
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Center(
          child: Column(
            children: [
              CustomImage(
                path: image,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.cover,
              ),
              widget
            ],
          ),
        ),
      ),
    );
  }
}
