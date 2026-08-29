import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _selected = "Burger";

  String get selected => _selected;

  void select(String value) {
    _selected = value;
    notifyListeners();
  }
}
