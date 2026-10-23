
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vlr/services/app_them_helper.dart';
import 'package:vlr/views/screens/dashboard/action/action_screen.dart';
import 'package:vlr/views/screens/dashboard/home_screen/home_screen.dart';
import 'package:vlr/views/screens/dashboard/service/service_screen.dart';
import 'package:vlr/views/screens/dashboard/transactions/transactions_screen.dart';

import '../../../controllers/dashboard_controller.dart';
import '../../../generated/assets.dart';
import '../../../services/theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashBoardController>(
        builder: (DashBoardController controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: [
              HomeScreen(),
              ServiceScreen(),
              TransactionsScreen(),
              ActionScreen()
            ][controller.dashPage],
          );
        },
      ),
    bottomNavigationBar: GetBuilder<DashBoardController>(
  builder: (DashBoardController controller) {
    final theme = Theme.of(context);

    void changePage(int index) {
      if (controller.dashPage == index) return;

      controller.dashPage = index;

      // Rebuild GetBuilder to update the selected icon.
      controller.update();
    }

    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: theme.colorScheme.outlineVariant,
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: theme.brightness == Brightness.dark ? 0.16 : 0.03,
              ),
              blurRadius: 10.r,
              offset: Offset(0, -3.h),
            ),
          ],
        ),
        child: Row(
          children: [
            BottomNavigationItemWidget(
              title: 'Home',
              icon: Assets.svgsHomeSelect,
              isActive: controller.dashPage == 0,
              onTap: () => changePage(0),
            ),
            BottomNavigationItemWidget(
              title: 'Services',
              icon: Assets.svgsService,
              isActive: controller.dashPage == 1,
              onTap: () => changePage(1),
            ),
            BottomNavigationItemWidget(
              title: 'Transactions',
              icon: Assets.svgsTransaction,
              isActive: controller.dashPage == 2,
              onTap: () => changePage(2),
            ),
            BottomNavigationItemWidget(
              title: 'Action',
              icon: Assets.svgsAction,
              isActive: controller.dashPage == 3,
              onTap: () => changePage(3),
            ),
          ],
        ),
      ),
    );
  },
),
    );
  }
}
class BottomNavigationItemWidget extends StatelessWidget {
  const BottomNavigationItemWidget({
    super.key,
    required this.title,
    required this.icon,
    this.isActive = false,
    this.onTap,
  });

  final String title;
  final String icon;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.isDarkMode; // Or Theme.of(context).brightness == Brightness.dark

    // 👇 FIXED COLORS FOR BOTH MODES
    // Dark mode: Selected is White, Unselected is Light Grey
    // Light mode: Selected is Primary, Unselected is Dark Grey
    final Color selectedColor = isDark ? primaryColorText : theme.primaryColor;
    final Color unselectedColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;
        
    return Expanded(
      child: Semantics(
        button: true,
        selected: isActive,
        label: title,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14.r),
          splashColor: selectedColor.withValues(alpha: 0.1),
          highlightColor: selectedColor.withValues(alpha: 0.05),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              // Very subtle background for the whole item when active
              color: isActive
                  ? selectedColor.withValues(alpha: 0.05)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  width: 48.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // Stronger highlight behind just the icon
                    color: isActive
                        ? selectedColor.withValues(alpha: isDark ? 0.15 : 0.12)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutBack, // Gives a nice little pop effect
                    scale: isActive ? 1.15 : 1.0,
                    child: SvgPicture.asset(
                      icon,
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                        isActive ? selectedColor : unselectedColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: theme.textTheme.labelSmall!.copyWith(
                    fontSize: 10.sp,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: isActive ? selectedColor : unselectedColor,
                    letterSpacing: 0.2,
                  ),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}