import 'package:flutter/material.dart';

class CustomizeDishProvider extends ChangeNotifier {
  int _quantity = 2;

  int get quantity => _quantity;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  void setQuantity(int value) {
    if (value > 0) {
      _quantity = value;
      notifyListeners();
    }
  }

  void resetQuantity() {
    _quantity = 2;
    notifyListeners();
  }
}