import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/bank_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/widget/appbar/appbar2.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class AddNewBankScreen extends StatefulWidget {
  const AddNewBankScreen({super.key});

  @override
  State<AddNewBankScreen> createState() => _AddNewBankScreenState();
}

class _AddNewBankScreenState extends State<AddNewBankScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankController>(
      builder: (bankController) {
        return Scaffold(
          appBar: const AppBar2(
            title: "Add Bank Account",
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: AppConstants.screenPadding,
              child: CustomButton(
                height: 55.h,
                radius: 12.r,
                gradient: context.buttonGradient,
                onTap: () {
                  FocusScope.of(context).unfocus();

                  if (_formKey.currentState?.validate() ?? false) {
                    // TODO: Call your add-bank API through BankController.
                    //
                    // Use these controller values:
                    // bankController.accountHolderNameController.text
                    // bankController.bankNameController.text
                    // bankController.accountNoController.text
                    // bankController.ifscCodeController.text
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: white,
                      size: 20.sp,
                    ),
                    sizedBoxWidth(width: 8),
                    CustomText(
                      "Add Bank Account",
                      style: Helper(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 15.sp,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: AppConstants.screenPadding,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxHeight(height: 20),

                  CustomText(
                    "Bank Account Details",
                    style: Helper(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                  ),

                  sizedBoxHeight(height: 8),

                  CustomText(
                    "Enter your bank details to add an account "
                    "for receiving payments.",
                    style: Helper(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13.sp,
                          color: context.greyText,
                        ),
                  ),

                  sizedBoxHeight(height: 28),

                  // Account Holder Name
                  AppTextFieldWithHeading(
                    controller: bankController.accountHolderNameController,
                    heading: "Account Holder Name",
                    isRequired: true,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Icon(
                        Icons.person_outline_rounded,
                        color: context.greyText,
                      ),
                    ),
                    hindText: "Account Holder Name",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter account holder name";
                      }
                      return null;
                    },
                  ),

                  sizedBoxHeight(height: 16),

                  // Bank Name
                  AppTextFieldWithHeading(
                    controller: bankController.bankNameController,
                    heading: "Bank Name",
                    isRequired: true,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Icon(
                        Icons.account_balance_outlined,
                        color: context.greyText,
                      ),
                    ),
                    hindText: "Bank Name",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter bank name";
                      }
                      return null;
                    },
                  ),

                  sizedBoxHeight(height: 16),

                  // Account Number
                  AppTextFieldWithHeading(
                    controller: bankController.accountNoController,
                    heading: "Account Number",
                    isRequired: true,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Icon(
                        Icons.credit_card_rounded,
                        color: context.greyText,
                      ),
                    ),
                    hindText: "Account Number",
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(18),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter account number";
                      }

                      if (!RegExp(r'^\d{9,18}$').hasMatch(value)) {
                        return "Enter a valid account number";
                      }

                      return null;
                    },
                  ),

                  sizedBoxHeight(height: 16),

                  // Confirm Account Number
                  AppTextFieldWithHeading(
                    controller: bankController.confirmAccountNoController,
                    heading: "Confirm Account Number",
                    isRequired: true,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Icon(
                        Icons.verified_user_outlined,
                        color: context.greyText,
                      ),
                    ),
                    hindText: "Confirm Account Number",
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(18),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm account number";
                      }

                      if (value != bankController.accountNoController.text) {
                        return "Account numbers do not match";
                      }

                      return null;
                    },
                  ),

                  sizedBoxHeight(height: 16),

                  // IFSC Code
                  AppTextFieldWithHeading(
                    controller: bankController.ifscCodeController,
                    heading: "IFSC Code",
                    isRequired: true,
                    preFixWidget: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Icon(
                        Icons.code_rounded,
                        color: context.greyText,
                      ),
                    ),
                    hindText: "IFSC Code",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z0-9]'),
                      ),
                      LengthLimitingTextInputFormatter(11),
                    ],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter IFSC code";
                      }

                      if (!RegExp(
                        r'^[A-Z]{4}0[A-Z0-9]{6}$',
                        caseSensitive: false,
                      ).hasMatch(value.trim())) {
                        return "Please enter a valid IFSC code";
                      }

                      return null;
                    },
                  ),

                  sizedBoxHeight(height: 24),

                  // Security Information
                  Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: context.primaryColorText.withValues(
                        alpha: 0.06,
                      ),
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                        color: context.borderColor,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          color: context.primaryColorText,
                          size: 22.sp,
                        ),
                        sizedBoxWidth(width: 10),
                        Expanded(
                          child: CustomText(
                            "Make sure your bank details are correct "
                            "before submitting. Your account details "
                            "should match your bank records.",
                            overflow: TextOverflow.clip,
                            style:
                                Helper(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                      color: context.greyText,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  sizedBoxHeight(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
