import 'package:flutter/material.dart';
import 'package:foodie/screens/browse_restaurants_screen/browse_restaurants_screen.dart';
import 'package:foodie/screens/delivery_mode_screen/delivery_mode_screen.dart';

import '../screens/cart_screen/cart_screen.dart';
import '../screens/create_profile_screen/create_profile_screen.dart';
import '../screens/customize_dish_screen/customize_dish_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/onboarding_screen/onBoarding_screen.dart';
import '../screens/reel_screen/reel_screen.dart';
import '../screens/search_screen/search_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/verification_screen/verification_screen.dart';

class AppRoutes {
  AppRoutes._(); // Private constructor

  // Route names
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String verification = '/verification';
  static const String createProfile = '/createProfile';
  static const String home = '/home';
  static const String homeScreen = '/homeScreen';
  static const String searchScreen = '/searchScreen';
  static const String reelScreen = '/reelScreen';
  static const String browseRestaurants = '/browseRestaurants';
  static const String customizeDish = '/customizeDish';
  static const String cartScreen = '/cartScreen';
  static const String deliveryMode = '/DeliveryMode';
  // Named routes map (Alternative approach)
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onBoarding: (context) => OnboardingScreen(),
    login: (context) => LoginScreen(),
    verification: (context) => VerificationScreen(),
    createProfile: (context) => CreateProfileScreen(),
    homeScreen: (context) => HomeScreen(),
    searchScreen: (context) => SearchScreen(),
    reelScreen: (context) => ReelScreen(),
    browseRestaurants: (context) => BrowseRestaurantsScreen(),
    customizeDish: (context) => CustomizeDishScreen(),
    cartScreen: (context) => CartScreen(),
    deliveryMode: (context) => DeliveryModeScreen(),
  };
}