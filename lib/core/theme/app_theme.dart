import 'package:e_cubox_assesment/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getAppTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 6,
        titleTextStyle: AppTextStyle.display.medium,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: AppColors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
