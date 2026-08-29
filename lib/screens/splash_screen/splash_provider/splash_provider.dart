import 'package:flutter/material.dart';
import 'dart:async';

import '../../../utils/app_routes.dart';
class SplashProvider extends ChangeNotifier {
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  void startSplash(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      _isLoaded = true;
      notifyListeners(); // triggers Consumer / Selector
      Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
    });
  }
}