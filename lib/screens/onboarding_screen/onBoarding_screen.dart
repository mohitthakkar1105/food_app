import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../customWidgets/app_button.dart';
import '../../utils/sizer.dart';
import '../../utils/app_colors.dart';
import 'onboarding_provider/onboarding_provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final sizer = Sizer()..init(context);

    return Scaffold(
      body: SafeArea(
        child: Consumer<OnboardingProvider>(
          builder: (context, provider, _) {
            final page = provider.onboardingData[provider.currentIndex];
            final isLast = provider.isLastPage;

            return Stack(
              children: [

                /// 🔥 BACKGROUND IMAGE
                Positioned.fill(
                  child: Image.asset(
                    page.image,
                    fit: BoxFit.cover,
                  )
                      .animate(key: ValueKey(provider.currentIndex))
                      .fadeIn(duration: 400.ms)
                      .scale(begin: const Offset(1.1, 1.1)),
                ),

                /// 🔥 GRADIENT
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),
                ),

                /// 🍔 FLYING FOOD (BACKGROUND DECORATION)
                flyingFood(
                  icon: Icons.fastfood,
                  left: sizer.setWidth(28),
                  top: sizer.setHeight(110),
                  size: 40,
                ),

                flyingFood(
                  icon: Icons.local_pizza,
                  left: sizer.setWidth(260),
                  top: sizer.setHeight(170),
                  size: 36,
                  delay: 400.ms,
                ),

                flyingFood(
                  icon: Icons.icecream,
                  left: sizer.setWidth(140),
                  top: sizer.setHeight(80),
                  size: 32,
                  delay: 800.ms,
                ),

                /// 🔥 CONTENT
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizer.setWidth(24),
                    vertical: sizer.setHeight(40),
                  ),
                  child: Column(
                    children: [

                      const Spacer(),

                      /// TITLE
                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontSize: sizer.setSp(28),
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      )
                          .animate(
                        key: ValueKey('title_${provider.currentIndex}'),
                      )
                          .fadeIn(duration: 300.ms)
                          .slideY(begin: 0.4),

                      SizedBox(height: sizer.setHeight(16)),

                      /// DESCRIPTION
                      Text(
                        page.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontSize: sizer.setSp(16),
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      )
                          .animate(
                        key: ValueKey('desc_${provider.currentIndex}'),
                      )
                          .fadeIn(delay: 150.ms)
                          .slideY(begin: 0.3),

                      SizedBox(height: sizer.setHeight(30)),

                      /// INDICATOR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          provider.onboardingData.length,
                              (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: provider.currentIndex == index
                                  ? AppColors.indicatorActive
                                  : AppColors.indicatorInactive,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: sizer.setHeight(24)),

                      /// 🔥 BREATHING NEXT BUTTON
                      AppButton(
                        text: isLast ? "Get Started" : "NEXT",
                        onTap: () => provider.nextPage(context),
                        backgroundColor: scheme.primary,
                        textColor: scheme.onPrimary,
                        height: sizer.setHeight(58),
                        width: double.infinity,
                        borderRadius: 12,
                      )
                          .animate(
                        onPlay: (controller) {
                          if (!isLast) {
                            controller.repeat(reverse: true);
                          }
                        },
                      )
                          .scale(
                        begin: const Offset(1.0, 1.0),
                        end: const Offset(1.03, 1.03),
                        duration: 1200.ms,
                        curve: Curves.easeInOut,
                      ),

                      SizedBox(height: sizer.setHeight(16)),

                      /// SKIP
                      GestureDetector(
                        onTap: () => provider.skip(context),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// 🍕 FLYING FOOD WIDGET
Widget flyingFood({
  required IconData icon,
  required double left,
  required double top,
  double size = 36,
  Duration delay = Duration.zero,
}) {
  return Positioned(
    left: left,
    top: top,
    child: Icon(
      icon,
      size: size,
      color: Colors.white.withOpacity(0.25),
    )
        .animate(delay: delay)
        .fadeIn(duration: 600.ms)
        .slideY(
      begin: 0.0,
      end: -0.15,
      duration: 2500.ms,
      curve: Curves.easeInOut,
    )
        .slideX(
      begin: 0.0,
      end: 0.05,
      duration: 2500.ms,
      curve: Curves.easeInOut,
    )
        .then()
        .animate(onPlay: (c) => c.repeat(reverse: true)),
  );
}
