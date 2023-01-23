import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier {
  void disableButton() {
    var grayButton = ThemeData();
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier {
  Color primaryColor = Colors.black;
  Color backgroundColor = Colors.white;

  void changeThemeToDark() {
    Color primaryColor = Colors.black;
    Color backgroundColor = Colors.white;
    notifyListeners();
  }

  void changeThemeToLight() {
    Color primaryColor = Colors.black;
    Color backgroundColor = Colors.white;
    notifyListeners();
  }
}

class BookProvider extends ChangeNotifier {}
