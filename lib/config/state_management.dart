import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todaysecho/screens/home_screen.dart';

class AppProvider extends ChangeNotifier {
  Widget screen = HomeScreen();

  void changeScreen(Widget _screen) {
    screen = _screen;
    notifyListeners();
  }
}
