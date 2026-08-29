import 'package:flutter/material.dart';
import 'package:foodie/utils/app_routes.dart';

import '../../../customWidgets/app_snackbar.dart';
class ProfileProvider extends ChangeNotifier {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // State
  String? _location;
  bool _isLoading = false;

  // Getters
  String? get location => _location;
  bool get isLoading => _isLoading;

  // Access Location
  void accessLocation() {
    // TODO: Integrate location package (geolocator/location)
    // For now, setting dummy location
    _location = "Current Location Detected";
    notifyListeners();
    debugPrint('Location accessed: $_location');
  }

  // Validation
  String? _validateName() {
    if (nameController.text.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (nameController.text.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _validateMobile() {
    if (mobileController.text.trim().isEmpty) {
      return 'Please enter your mobile number';
    }
    if (mobileController.text.trim().length != 10) {
      return 'Mobile number must be 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(mobileController.text.trim())) {
      return 'Mobile number must contain only digits';
    }
    return null;
  }

  String? _validateAddress() {
    if (addressController.text.trim().isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  String? _validateLocation() {
    if (_location == null || _location!.isEmpty) {
      return 'Please access your location';
    }
    return null;
  }

  // Update Profile
  Future<void> updateProfile(BuildContext context) async {
    // Validate all fields
    String? nameError = _validateName();
    if (nameError != null) {
      _showSnackBar(context, nameError);
      return;
    }

    String? mobileError = _validateMobile();
    if (mobileError != null) {
      _showSnackBar(context, mobileError);
      return;
    }

    String? addressError = _validateAddress();
    if (addressError != null) {
      _showSnackBar(context, addressError);
      return;
    }

    String? locationError = _validateLocation();
    if (locationError != null) {
      _showSnackBar(context, locationError);
      return;
    }

    // Start loading
    _setLoading(true);

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    // TODO: API call will go here
    debugPrint('Profile Data:');
    debugPrint('Name: ${nameController.text.trim()}');
    debugPrint('Mobile: ${mobileController.text.trim()}');
    debugPrint('Address: ${addressController.text.trim()}');
    debugPrint('Location: $_location');

    // Stop loading
    _setLoading(false);

    // Show success message
    _showSnackBar(context, 'Profile updated successfully!', isError: false);

    // TODO: Navigate to next screen
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
  }

  // Helper: Set Loading State
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Helper: Show SnackBar
  void _showSnackBar(BuildContext context, String message, {bool isError = true}) {
    AppSnackBar.show(
      context,
      message: message,
      type: isError ? SnackType.error : SnackType.success,
    );
  }

  // Clear all data
  void clearData() {
    nameController.clear();
    mobileController.clear();
    addressController.clear();
    _location = null;
    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    super.dispose();
  }
}