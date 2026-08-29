import 'package:flutter/material.dart';
import 'package:foodie/utils/App_colors.dart';
import '../utils/sizer.dart'; // Import your Sizer class

class CustomAuthScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? email;
  final Widget content;
  final VoidCallback? onBackPressed;
  final String? backgroundImage; // Optional background image
  final BoxFit? imageFit; // Optional image fit

  const CustomAuthScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    this.email,
    required this.content,
    this.onBackPressed,
    this.backgroundImage,
    this.imageFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final sizer = Sizer();
    sizer.init(context);

    return Scaffold(
      backgroundColor: AppColors.authBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Black Section - Header with optional background image
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.authBackground,
                image: backgroundImage != null
                    ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: imageFit,
                )
                    : null,
              ),
              child: Container(
                width: double.infinity,
                // Optional gradient overlay for better text readability on images
                decoration: backgroundImage != null
                    ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                )
                    : null,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizer.setWidth(20),
                    vertical: sizer.setHeight(20),
                  ),
                  child: Column(
                    children: [
                      // Back Button (Optional)
                      if (onBackPressed != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: onBackPressed,
                            child: Container(
                              width: sizer.setWidth(45),
                              height: sizer.setHeight(45),
                              decoration: BoxDecoration(
                                color: scheme.surface,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: AppColors.iconColor,
                                  size: sizer.setWidth(20),
                                ),
                              ),
                            ),
                          ),
                        ),

                      SizedBox(
                          height: sizer
                              .setHeight(onBackPressed != null ? 30 : 50)),

                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.w700,
                          fontSize: sizer.setSp(30),
                          height: 1.0,
                          letterSpacing: 0,
                          color: scheme.onPrimary,
                        ),
                      ),

                      SizedBox(height: sizer.setHeight(10)),

                      // Subtitle
                      Opacity(
                        opacity: 0.85,
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w400,
                            fontSize: sizer.setSp(16),
                            height: 1.625, // 26px / 16px = 1.625
                            letterSpacing: 0,
                            color: scheme.onPrimary,
                          ),
                        ),
                      ),

                      // Email (Optional)
                      if (email != null) ...[
                        SizedBox(height: sizer.setHeight(10)),
                        Text(
                          email!,
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w700,
                            fontSize: sizer.setSp(16),
                            height: 1.48, // 148%
                            letterSpacing: 0,
                            color: scheme.onPrimary,
                          ),
                        ),
                      ],

                      SizedBox(height: sizer.setHeight(20)),
                    ],
                  ),
                ),
              ),
            ),

            // White Section - Content Area
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sizer.setWidth(24)),
                    topRight: Radius.circular(sizer.setWidth(24)),
                  ),
                ),
                child: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}