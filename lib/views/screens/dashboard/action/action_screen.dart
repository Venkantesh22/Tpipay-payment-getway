import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/screens/dashboard/action/widget/account_section.dart';
import 'package:vlr/views/screens/dashboard/action/widget/heading_text_widget.dart';
import 'package:vlr/views/screens/dashboard/action/widget/profile_info_section.dart';
import 'package:vlr/views/screens/dashboard/action/widget/setting_section.dart';
import 'package:vlr/views/screens/dashboard/action/widget/supper_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/appbar_widget.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        body: SingleChildScrollView(
          padding: AppConstants.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileInfoSection(),
              sizedBoxHeight(height: 18),
              const HeadingTextWidget(title: "Account & Verification"),
              sizedBoxHeight(height: 8),
              const AccountSection(),
              sizedBoxHeight(height: 18),
              const HeadingTextWidget(title: "App Setting"),
              sizedBoxHeight(height: 8),
              const SettingSection(),
              sizedBoxHeight(height: 18),
              const HeadingTextWidget(title: "Support & Legal"),
              sizedBoxHeight(height: 8),
              const SupperSection(),
              sizedBoxHeight(height: 18),
              CustomButton(
                onTap: () {},
                type: ButtonType.secondary,
                radius: 100.r,
                borderColor: context.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: context.red,
                      size: 18.sp,
                    ),
                    sizedBoxWidth(width: 6),
                    CustomText(
                      "Logout",
                      style: Helper(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.sp,
                            color: context.red,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
