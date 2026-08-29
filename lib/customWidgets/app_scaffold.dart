import 'package:flutter/material.dart';
import '../utils/sizer.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;

  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;

  /// 🔮 Future use
  final String? backgroundImageAsset;
  final BoxFit backgroundImageFit;

  final EdgeInsetsGeometry? padding;

  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,

    // 🔮 future ready
    this.backgroundImageAsset,
    this.backgroundImageFit = BoxFit.cover,

    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor ?? Colors.transparent,
      appBar: appBar,

      body: Stack(
        children: [
          /// --------------------------------
          /// 🔮 BACKGROUND COLOR LAYER
          /// --------------------------------
          // if (backgroundColor != null)
          //   Positioned.fill(
          //     child: Container(
          //       color: backgroundColor,
          //     ),
          //   ),

          /// --------------------------------
          /// 🔮 BACKGROUND IMAGE LAYER
          /// --------------------------------
          if (backgroundImageAsset != null)
            Positioned.fill(
              child: Image.asset(
                backgroundImageAsset!,
                fit: backgroundImageFit,
              ),
            ),

          /// --------------------------------
          /// 🧱 MAIN CONTENT
          /// --------------------------------
          SafeArea(
            child: Padding(
              padding: padding ??
                  EdgeInsets.symmetric(
                    horizontal: sizer.setWidth(2),
                    vertical: sizer.setHeight(12),
                  ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
