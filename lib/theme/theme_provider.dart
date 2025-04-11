import 'package:flutter/material.dart';
import 'package:first_app/theme/dark_mode.dart';
import 'package:first_app/theme/light.dart';

class ThemeProvider with ChangeNotifier
{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData)
  {
    _themeData = themeData;
    notifyListeners();
  }

  void toogleTheme()
  {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}