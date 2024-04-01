import 'package:e_cubox_assesment/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../theme/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.prefix,
    this.maxLines,
  });

  final Function(String val)? onChanged;
  final TextEditingController? controller;
  final String? Function(String? val)? validator;
  final String? labelText;
  final String? hintText;
  final Widget? prefix;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.display.small,
      onChanged: onChanged,
      autofocus: false,
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      cursorColor: AppColors.black,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: true,
      decoration: InputDecoration(
        prefixIcon: prefix,
        counter: const SizedBox.shrink(),
        enabled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.black.withOpacity(0.6)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.red.withOpacity(0.6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.black.withOpacity(0.6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.black.withOpacity(0.6)),
        ),
        errorStyle: AppTextStyle.body.small.red.regular,
        labelStyle: AppTextStyle.title.small.black.regular,
        hintStyle: AppTextStyle.title.small.regular,
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
