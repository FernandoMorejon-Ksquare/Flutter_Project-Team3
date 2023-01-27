import 'package:flutter/material.dart';

class AlertManager {
  displaySnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 1500),
        content: Text(
          message,
          style: TextStyle(
              fontSize: 20.0,
              color: message == "Book already in favorites"
                  ? Colors.red
                  : Colors.green),
        )));
  }
}
