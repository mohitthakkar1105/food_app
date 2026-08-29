import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/sizer.dart';

class AppTextField extends StatelessWidget {
  final String? hint;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? hintColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool? enabled;
  final String? prefixText;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    this.hint,
    this.icon,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.obscureText,
    this.onChanged,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.hintColor,
    this.width,
    this.height,
    this.borderRadius,
    this.enabled,
    this.prefixText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return Container(
      width: width ?? sizer.setWidth(327),
      height: height ?? sizer.setHeight(62),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFF0F5FA),
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: Row(
        children: [
          SizedBox(width: sizer.setWidth(16)),
          if (icon != null)
            Icon(
              icon,
              color: iconColor ?? const Color(0xFFA0A5BA),
              size: sizer.setWidth(20),
            ),
          if (icon != null) SizedBox(width: sizer.setWidth(12)),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              onChanged: onChanged,
              maxLength: maxLength,
              enabled: enabled ?? true,
              inputFormatters: maxLength != null
                  ? [LengthLimitingTextInputFormatter(maxLength)]
                  : null,
              style: TextStyle(
                fontFamily: 'Sen',
                fontWeight: FontWeight.w400,
                fontSize: sizer.setSp(14),
                color: textColor ?? const Color(0xFF1C1C28),
                height: 1.0,
                letterSpacing: 0,
              ),
              decoration: InputDecoration(
                hintText: hint,
                prefixText: prefixText,
                prefixStyle: TextStyle(
                  fontFamily: 'Sen',
                  fontWeight: FontWeight.w400,
                  fontSize: sizer.setSp(14),
                  color: textColor ?? const Color(0xFF1C1C28),
                  height: 1.0,
                  letterSpacing: 0,
                ),
                hintStyle: TextStyle(
                  fontFamily: 'Sen',
                  fontWeight: FontWeight.w400,
                  fontSize: sizer.setSp(14),
                  color: hintColor ?? const Color(0xFFA0A5BA),
                  height: 1.0,
                  letterSpacing: 0,
                ),
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
          if (suffixIcon != null) suffixIcon!,
          SizedBox(width: sizer.setWidth(16)),
        ],
      ),
    );
  }
}