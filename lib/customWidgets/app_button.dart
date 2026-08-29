import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 12,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontFamily: 'Sen',
          ),
        ),
      ),
    );
  }
}



class CustomAppButton extends StatelessWidget {
  final Widget child;

  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;

  const CustomAppButton({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 12,
    this.height,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: child,
      ),
    );
  }
}
