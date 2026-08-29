import 'package:flutter/material.dart';

import '../../../utils/app_routes.dart';

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<OnboardingData> onboardingData = [
    OnboardingData(
      image: 'assets/images/png/onbording_1.png',
      title: 'All your favorites',
      description:
      'Get all your loved foods in one once place, you just place the orer we do the rest',
    ),
    OnboardingData(
      image: 'assets/images/png/onbording_2.png',
      title: 'Order from chosen chef',
      description:
      'Order from your favorite restaurants and get food delivered to your doorstep',
    ),
  ];

  bool get isLastPage => _currentIndex == onboardingData.length - 1;

  void nextPage(BuildContext context) {
    if (isLastPage) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      _currentIndex++;
      notifyListeners();
    }
  }

  void skip(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}