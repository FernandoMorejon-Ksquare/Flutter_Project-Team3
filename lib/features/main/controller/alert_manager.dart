import 'package:flutter/material.dart';

class AlertManager {
  displaySnackBar(context, message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
