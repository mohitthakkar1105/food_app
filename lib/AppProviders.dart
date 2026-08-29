import 'package:flutter/material.dart';
import 'package:foodie/screens/cart_screen/cart_provider/cart_provider.dart';
import 'package:foodie/screens/create_profile_screen/create_profile_provider/profile_provider.dart';
import 'package:foodie/screens/customize_dish_screen/customize_dish_provider/customize_dish_provider.dart';
import 'package:foodie/screens/drawer_screen/provider/drawer_provider.dart';
import 'package:foodie/screens/onboarding_screen/onboarding_provider/onboarding_provider.dart';
import 'package:foodie/screens/search_screen/search_provider/search_provider.dart';
import 'package:foodie/screens/splash_screen/splash_provider/splash_provider.dart';
import 'package:foodie/screens/verification_screen/verification_provider/verification_provider.dart';
import 'package:provider/provider.dart';


class AppProviders {
  static MultiProvider build(Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => VerificationProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => CustomizeDishProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: child,
    );
  }
}
