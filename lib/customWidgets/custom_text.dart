import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  /// 🔥 New customizable properties
  final String? fontFamily;
  final double? letterSpacing;
  final double? lineHeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.letterSpacing,
    this.lineHeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        height: lineHeight,
        decoration: decoration,
        fontStyle: fontStyle,
      ),
    );
  }
}
