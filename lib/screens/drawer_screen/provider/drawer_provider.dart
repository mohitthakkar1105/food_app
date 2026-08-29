import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  // Open the drawer
  void openDrawer() {
    if (_scaffoldKey.currentState != null) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  // Close the drawer
  void closeDrawer() {
    if (_scaffoldKey.currentState != null &&
        _scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(_scaffoldKey.currentContext!).pop();
    }
  }

  // Toggle drawer (open if closed, close if open)
  void toggleDrawer() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        Navigator.of(_scaffoldKey.currentContext!).pop();
      } else {
        _scaffoldKey.currentState!.openDrawer();
      }
    }
  }
}