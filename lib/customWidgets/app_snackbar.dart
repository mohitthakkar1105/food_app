import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppSnackBar {
  static void show(
      BuildContext context, {
        required String message,
        SnackType type = SnackType.info,
      }) {
    Color bgColor;
    IconData icon;

    switch (type) {
      case SnackType.success:
        bgColor = AppColors.success;
        icon = Icons.check_circle_rounded;
        break;
      case SnackType.error:
        bgColor = AppColors.error;
        icon = Icons.error_rounded;
        break;
      case SnackType.warning:
        bgColor = AppColors.warning;
        icon = Icons.warning_amber_rounded;
        break;
      default:
        bgColor = AppColors.primary;
        icon = Icons.info_rounded;
    }

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent, // 🔥 fully custom container
      elevation: 0,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: bgColor.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

enum SnackType { success, error, warning, info }
