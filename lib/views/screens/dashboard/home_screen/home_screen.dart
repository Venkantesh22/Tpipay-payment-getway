import 'package:flutter/material.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/appbar_widget.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/banner_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/recent_transaction_section/recent_transaction_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/row_service_section/row_service_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/user_profile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Column(
          children: [
            const UserProfileWidget(),
            sizedBoxHeight(height: 16),
            const HomeBanner(),
            sizedBoxHeight(height: 16),
            const RowOfServiceSection(),
            sizedBoxHeight(height: 16),
            RecentTransactionsSection()

                         

          ],
        ),
      ),
    );
  }
}
