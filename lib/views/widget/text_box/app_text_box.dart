import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/input_decoration.dart';
import 'package:vlr/services/theme.dart';

class AppTextFieldWithHeading extends StatefulWidget {
  final TextEditingController controller;
  final String? heading;
  final Widget? headingWidget;
  final String hindText;
  final TextStyle? hintStyle;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? preFixWidget;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool isRequired;
  final bool readOnly;
  final Color? borderColor;
  final double? borderWidth;
  final Color? bgColor;
  final VoidCallback? onTap;
  final double borderRadius;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  const AppTextFieldWithHeading({
    super.key,
    required this.controller,
    required this.hindText,
    this.hintStyle,
    this.validator,
    this.heading,
    this.headingWidget,
    this.keyboardType,
    this.suffix,
    this.prefixText,
    this.prefixStyle,
    this.obscureText = false,
    this.inputFormatters,
    this.maxLines,
    this.preFixWidget,
    this.isRequired = false,
    this.readOnly = false,
    this.borderColor,
    this.borderWidth,
    this.bgColor,
    this.onTap,
    this.onChanged,
    this.borderRadius = 12.0,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<AppTextFieldWithHeading> createState() =>
      _AppTextFieldWithHeadingState();
}

class _AppTextFieldWithHeadingState extends State<AppTextFieldWithHeading> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Theme-aware text styles.
    final hintStyleLocal = widget.hintStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: context.greyText,
          letterSpacing: 0,
        );

    final inputStyle = theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      color: colorScheme.onSurface,
    );

    final prefixStyleLocal = widget.prefixStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14.sp,
          color: colorScheme.onSurface,
        );

    // Keep password fields on a single line.
    final int effectiveMaxLines = _obscure ? 1 : (widget.maxLines ?? 1);

    // Use the supplied suffix, or display the password visibility toggle.
    final Widget? suffixWidget = widget.suffix ??
        (widget.obscureText
            ? IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                tooltip: _obscure ? 'Show password' : 'Hide password',
                icon: Icon(
                  _obscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: colorScheme.onSurface.withValues(alpha: 0.65),
                  size: 21.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.heading != null || widget.headingWidget != null) ...[
          Row(
            children: [
              widget.headingWidget ??
                  Text(
                    widget.heading!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
              SizedBox(width: 4.w),
              if (widget.isRequired)
                Text(
                  "*",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.error,
                  ),
                ),
            ],
          ),
          SizedBox(height: 7.h),
        ],
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          obscureText: _obscure,
          inputFormatters: widget.inputFormatters,
          maxLines: effectiveMaxLines,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          style: inputStyle,
          cursorColor: colorScheme.primary,
          decoration: CustomDecoration.inputDecoration(
            borderRadius: widget.borderRadius,
            suffix: suffixWidget,
            icon: widget.preFixWidget,
            prefixText: widget.prefixText,
            prefixStyle: prefixStyleLocal,
            bgColor: widget.bgColor ?? colorScheme.surfaceContainerHighest,
            hint: widget.hindText,
            hintStyle: hintStyleLocal,
            borderColor: widget.borderColor ?? colorScheme.outline,
            borderWidth: widget.borderWidth ?? 1.0,
            context: context,
          ).copyWith(
            // 👇 ADDED THIS: This adjusts the internal padding to make the box ~56px tall
            // while allowing the validation error text to show safely underneath.
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            // Optional: If contentPadding isn't enough, you can also force the minimum height of the input area:
            // constraints: BoxConstraints(minHeight: 56.h),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
