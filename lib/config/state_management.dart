import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todaysecho/config/data_config.dart';
import 'package:todaysecho/screens/home_screen.dart';

class AppProvider extends ChangeNotifier {
  Widget screen = HomeScreen();
  List<ContentData> data = [];

  void changeScreen(Widget _screen) {
    screen = _screen;
    notifyListeners();
  }

  void addToBookmark(ContentData contentData) {
    data.add(contentData);
    notifyListeners();
  }

  void removeBookMark(ContentData contentData) {
    data.remove(contentData);
    notifyListeners();
  }
}
