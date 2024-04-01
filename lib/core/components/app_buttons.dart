import 'package:e_cubox_assesment/core/theme/app_colors.dart';
import 'package:e_cubox_assesment/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.backgroundColor = AppColors.teal,
    required this.text,
    required this.onPressed,
    this.height = 35,
    this.width,
  });

  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.body.small.black.semiBold,
        ),
      ),
    );
  }
}
