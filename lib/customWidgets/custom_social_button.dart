import 'package:flutter/material.dart';

import '../utils/sizer.dart';

class SocialButton extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final Color color;
  final Color? borderColor;
  final VoidCallback onTap;
  final BuildContext context;

  const SocialButton({
    this.icon,
    this.imagePath,
    required this.color,
    this.borderColor,
    required this.onTap,
    required this.context
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer();
    sizer.init(this.context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizer.setWidth(60),
        height: sizer.setHeight(60),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: icon != null
              ? Icon(
            icon,
            color: color == Colors.white ? Colors.grey.shade700 : Colors.white,
            size: sizer.setWidth(28),
          )
              : imagePath != null
              ? Image.asset(
            imagePath!,
            width: sizer.setWidth(28),
            height: sizer.setHeight(28),
          )
              : const SizedBox(),
        ),
      ),
    );
  }
}