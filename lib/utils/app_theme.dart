import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,

      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,

      background: AppColors.background,
      onBackground: AppColors.onBackground,

      surface: AppColors.surface,
      onSurface: AppColors.onSurface,

      error: AppColors.error,
      onError: AppColors.onError,
    ),

    scaffoldBackgroundColor: AppColors.background,
  );
}
