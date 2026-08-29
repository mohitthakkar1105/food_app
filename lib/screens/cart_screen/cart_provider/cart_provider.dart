import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // Store quantity for each item by index
  final Map<int, int> _itemQuantities = {
    0: 1,
    1: 1,
    2: 1,
  };

  int getQuantity(int index) {
    return _itemQuantities[index] ?? 1;
  }

  void incrementQuantity(int index) {
    _itemQuantities[index] = (_itemQuantities[index] ?? 1) + 1;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    final currentQuantity = _itemQuantities[index] ?? 1;
    if (currentQuantity > 1) {
      _itemQuantities[index] = currentQuantity - 1;
      notifyListeners();
    }
  }

  void setQuantity(int index, int quantity) {
    if (quantity > 0) {
      _itemQuantities[index] = quantity;
      notifyListeners();
    }
  }

  // Calculate total amount
  double getTotalAmount(List<Map<String, dynamic>> items) {
    double total = 0;
    for (int i = 0; i < items.length; i++) {
      final price = double.tryParse(items[i]['price'].replaceAll('₹', '')) ?? 0;
      final quantity = getQuantity(i);
      total += price * quantity;
    }
    return total;
  }

  void resetQuantities() {
    _itemQuantities.clear();
    notifyListeners();
  }
}