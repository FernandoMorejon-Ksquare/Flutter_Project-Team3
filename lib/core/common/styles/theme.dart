import 'package:flutter/material.dart';

class CustomTheme {
  var theme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 0, 0, 0)),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 0, 0, 0)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle:
            const MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 20)),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 0, 0, 0),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  );
}
