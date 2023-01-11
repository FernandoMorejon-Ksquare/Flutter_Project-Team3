import 'package:flutter/material.dart';

class AuthServiceProvider extends ChangeNotifier {}

class SnackbarServiceProvider extends ChangeNotifier {
  loginPassword(context) {
    const snackbar = SnackBar(content: Text("Your password is incorrect"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  registerMatch(context) {
    const snackbar = SnackBar(content: Text("Your passwords don't match"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  registerMatch2(context) {
    const snackbar = SnackBar(content: Text("Your passwords match"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
