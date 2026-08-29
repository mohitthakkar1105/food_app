import 'package:flutter/material.dart';
import 'dart:async';

import 'package:foodie/utils/app_routes.dart';

// Provider for OTP Verification
class VerificationProvider extends ChangeNotifier {
  int _remainingTime = 50;
  Timer? _timer;
  final TextEditingController pinController = TextEditingController();

  int get remainingTime => _remainingTime;

  void startTimer() {
    _remainingTime = 50;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void resendOtp() {
    // Add your resend OTP logic here
    startTimer();
  }

  void verifyOtp(BuildContext context) {
    if (pinController.text.length == 4) {
      // Add your verification logic here
      print('Verifying OTP: ${pinController.text}');
      Navigator.pushNamed(context, AppRoutes.createProfile);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    pinController.dispose();
    super.dispose();
  }
}
