import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vlr/controllers/transaction_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class SearchBarAndFilterSection extends StatefulWidget {
  const SearchBarAndFilterSection({super.key});

  @override
  State<SearchBarAndFilterSection> createState() =>
      _SearchBarAndFilterSectionState();
}

class _SearchBarAndFilterSectionState extends State<SearchBarAndFilterSection> {
  bool showFilter = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(builder: (transactionController) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextFieldWithHeading(
                  controller: transactionController.transactionSearchController,
                  hindText: "Search by name, ID or amount...",
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {},
                  preFixWidget: Icon(
                    Icons.search,
                    color: grey,
                    size: 18.sp,
                  ),
                ),
              ),
              sizedBoxWidth(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showFilter = !showFilter;
                  });
                },
                child: Container(
                  height: 56.h,
                  width: 56.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: context.borderColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Icon(
                    Icons.filter_list_rounded,
                    color: grey,
                    size: 30.sp,
                  ),
                ),
              )
            ],
          ),
          showFilter
              ? Column(
                  children: [
                    sizedBoxHeight(height: 20),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      width: double.infinity,
                      decoration: context.containerDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            "Filter Transactions",
                            overflow: TextOverflow.clip,
                            style:
                                Helper(context).textTheme.titleSmall?.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                          sizedBoxHeight(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: AppTextFieldWithHeading(
                                  controller:
                                      transactionController.fromDateController,
                                  hindText: "Start date",
                                  preFixWidget: Icon(
                                    Icons.calendar_today_outlined,
                                    color: context.greyDart1,
                                    size: 20.sp,
                                  ),
                                  headingWidget: CustomText(
                                    "From Date",
                                    overflow: TextOverflow.clip,
                                    style: Helper(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 12.sp,
                                          color: context.greyText,
                                        ),
                                  ),
                                ),
                              ),
                              sizedBoxWidth(width: 12.w),
                              Expanded(
                                child: AppTextFieldWithHeading(
                                  controller:
                                      transactionController.toDateController,
                                  hindText: "End date",
                                  preFixWidget: Icon(
                                    Icons.calendar_today_outlined,
                                    color: context.greyDart1,
                                    size: 20.sp,
                                  ),
                                  headingWidget: CustomText(
                                    "To Date",
                                    overflow: TextOverflow.clip,
                                    style: Helper(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 12.sp,
                                          color: context.greyText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          sizedBoxHeight(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: AppTextFieldWithHeading(
                                  controller: transactionController
                                      .minAmountSearchController,
                                  hindText: "Min Amount",
                                  preFixWidget: Icon(
                                    Icons.currency_rupee_sharp,
                                    color: context.greyDart1,
                                    size: 20.sp,
                                  ),
                                  headingWidget: CustomText(
                                    "Min amount",
                                    overflow: TextOverflow.clip,
                                    style: Helper(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 12.sp,
                                          color: context.greyText,
                                        ),
                                  ),
                                ),
                              ),
                              sizedBoxWidth(width: 12.w),
                              Expanded(
                                child: AppTextFieldWithHeading(
                                  controller: transactionController
                                      .maxAmountSearchController,
                                  hindText: "Max Amount",
                                  preFixWidget: Icon(
                                    Icons.currency_rupee_sharp,
                                    color: context.greyDart1,
                                    size: 20.sp,
                                  ),
                                  headingWidget: CustomText(
                                    "max amount",
                                    overflow: TextOverflow.clip,
                                    style: Helper(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 12.sp,
                                          color: context.greyText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          sizedBoxHeight(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onTap: () {},
                                  radius: 12.r,
                                  gradient: context.buttonGradient,
                                  child: CustomText(
                                    "Apply Filters",
                                    overflow: TextOverflow.clip,
                                    style: Helper(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 14.sp,
                                          color: white,
                                        ),
                                  ),
                                ),
                              ),
                              sizedBoxWidth(width: 10),
                              CustomButton(
                                onTap: () {},
                                radius: 12.r,
                                color: context.isDarkTheme
                                    ? Colors.transparent
                                    : context.primaryColor
                                        .withValues(alpha: 0.10),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.h),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.svgsReset,
                                        height: 16.h,
                                        width: 16.h,
                                        colorFilter: ColorFilter.mode(
                                            context.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      sizedBoxWidth(width: 6),
                                      CustomText(
                                        "Reset",
                                        overflow: TextOverflow.clip,
                                        style: Helper(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: 14.sp,
                                              color: context.primaryColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      );
    });
  }
}
