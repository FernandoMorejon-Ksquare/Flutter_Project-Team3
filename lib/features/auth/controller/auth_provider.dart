import 'package:flutter/material.dart';

class AuthServiceProvider extends ChangeNotifier {}

class SnackbarServiceProvider extends ChangeNotifier {
  loginPassword(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Your password is incorrect",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  registerMatch(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Your passwords don't match",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  registerMatch2(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Your passwords match",
          style: TextStyle(color: Colors.green),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
