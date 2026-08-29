import 'package:flutter/material.dart';
import 'package:foodie/screens/splash_screen/splash_provider/splash_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;
    final sizer = Sizer()..init(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final splashProvider = Provider.of<SplashProvider>(context, listen: false);
      if (!splashProvider.isLoaded) {
        splashProvider.startSplash(context);
      }
    });

    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: 0.8 + (value * 0.2),
                child: child,
              ),
            );
          },
          child: Image.asset(
            'assets/images/png/logo.png',
            width: sizer.setWidth(121.13),
            height: sizer.setHeight(58.88),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}