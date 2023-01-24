import 'package:flutter/material.dart';

class AlertManager {
  displaySnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 1500),
        content: Text(
          message,
          style: const TextStyle(fontSize: 20.0, color: Colors.green),
        )));
  }
}
