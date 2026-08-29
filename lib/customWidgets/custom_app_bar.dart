import 'dart:ui';

import 'package:flutter/material.dart';
import '../utils/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? subtitle;

  final bool centerTitle;
  final bool showBack;
  final Color? colorShowBack;

  final Widget? prefix;
  final VoidCallback? onPrefixTap;

  final Widget? suffix;
  final VoidCallback? onSuffixTap;
  final int? suffixBadgeCount;

  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;

  /// 🔥 NEW: bg colors for prefix & suffix
  final Color prefixBgColor;
  final Color suffixBgColor;

  final double height;
  final double elevation;

  const CustomAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.centerTitle = false,
    this.showBack = false,
    this.colorShowBack,
    this.prefix,
    this.onPrefixTap,

    this.suffix,
    this.onSuffixTap,
    this.suffixBadgeCount,

    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.iconColor = Colors.black,

    /// 🔥 defaults (old behavior safe)
    this.prefixBgColor = const Color(0x1A000000),
    this.suffixBgColor = const Color(0x1A000000),

    this.height = 72,
    this.elevation = 0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return Material(
      elevation: elevation,
      color: backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: sizer.setHeight(height),
          padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// 🔙 BACK OR PREFIX
              if (showBack || prefix != null)
                GestureDetector(
                  onTap: showBack
                      ? () => Navigator.pop(context)
                      : onPrefixTap,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: sizer.setWidth(40),
                    height: sizer.setWidth(40),
                    decoration: BoxDecoration(
                      color: prefixBgColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: showBack
                        ? Icon(
                      Icons.arrow_back_ios_new,
                      size: sizer.setSp(18),
                      color: colorShowBack ?? iconColor,
                    )
                        : prefix,
                  ),
                ),

              if (!centerTitle) SizedBox(width: sizer.setWidth(12)),

              /// 🏷 TITLE + SUBTITLE
              Expanded(
                child: Center(
                  child: _TitleBlock(
                    title: title,
                    subtitle: subtitle,
                    titleColor: titleColor,
                    sizer: sizer,
                    align: centerTitle
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                  ),
                ),
              ),

              /// 🔔 SUFFIX
              if (suffix != null)
                GestureDetector(
                  onTap: onSuffixTap,
                  behavior: HitTestBehavior.opaque,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: sizer.setWidth(40),
                        height: sizer.setWidth(40),
                        decoration: BoxDecoration(
                          color: suffixBgColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: suffix,
                      ),

                      /// 🔴 BADGE
                      if (suffixBadgeCount != null &&
                          suffixBadgeCount! > 0)
                        Positioned(
                          right: -4,
                          top: -8,
                          child: Container(
                            padding: EdgeInsets.all(sizer.setWidth(6)),
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              suffixBadgeCount!.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: sizer.setSp(15),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 Reusable title widget
class _TitleBlock extends StatelessWidget {
  final String? title;
  final Widget? subtitle;
  final Color titleColor;
  final Sizer sizer;
  final CrossAxisAlignment align;

  const _TitleBlock({
    required this.title,
    required this.subtitle,
    required this.titleColor,
    required this.sizer,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    if (title == null && subtitle == null) return const SizedBox();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: align,
      children: [
        if (title != null)
          Text(
            title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: sizer.setSp(16),
              fontWeight: FontWeight.w500,
              color: titleColor,
            ),
          ),
        if (subtitle != null) SizedBox(height: sizer.setHeight(2)),
        if (subtitle != null) subtitle!,
      ],
    );
  }
}


class CustomAppbar extends StatelessWidget {
  // Title
  final Widget? title;
  final bool centerTitle;
  final VoidCallback? onTitleTap;

  // Prefix
  final bool showPrefix;
  final Widget? prefix;
  final VoidCallback? onPrefixTap;

  // Suffix
  final bool showSuffix;
  final Widget? suffix;
  final VoidCallback? onSuffixTap;

  // UI
  final double height;
  final Color? backgroundColor;
  final Gradient? gradient;

  // Effects
  final bool enableBlur;
  final double blurSigma;

  const CustomAppbar({
    super.key,

    // Title
    this.title,
    this.centerTitle = true,
    this.onTitleTap,

    // Prefix
    this.showPrefix = false,
    this.prefix,
    this.onPrefixTap,

    // Suffix
    this.showSuffix = false,
    this.suffix,
    this.onSuffixTap,

    // UI
    this.height = kToolbarHeight,
    this.backgroundColor,
    this.gradient,

    // Effects
    this.enableBlur = false,
    this.blurSigma = 10,
  });

  @override
  Widget build(BuildContext context) {
    final bg = gradient == null ? backgroundColor ?? Colors.white : null;

    Widget bar = Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: bg, gradient: gradient),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // 🔹 PREFIX
            if (showPrefix)
              SizedBox(
                width: 48,
                child: GestureDetector(
                  onTap: onPrefixTap,
                  behavior: HitTestBehavior.opaque,
                  child: prefix ?? const SizedBox(),
                ),
              ),

            // 🔹 TITLE
            Expanded(
              child: GestureDetector(
                onTap: onTitleTap,
                behavior: HitTestBehavior.opaque,
                child: Align(
                  alignment: centerTitle
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: title ?? const SizedBox(),
                ),
              ),
            ),

            // 🔹 SUFFIX
            if (showSuffix)
              SizedBox(
                width: 48,
                child: GestureDetector(
                  onTap: onSuffixTap,
                  behavior: HitTestBehavior.opaque,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: suffix ?? const SizedBox(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    // 🔮 BLUR EFFECT
    if (enableBlur) {
      bar = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: bar,
        ),
      );
    }

    return bar;
  }
}
