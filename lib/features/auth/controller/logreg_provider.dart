import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';

class AuthServiceProvider extends ChangeNotifier {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  registerFirebase(context) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }).catchError((e) {
      String err = e.message;
      if (e.message == "Given String is empty or null") {}
      // ignore: invalid_return_type_for_catch_error
      return err;
    });
  }
}

class SnackbarServiceProvider extends ChangeNotifier {
  loginUser(context, message) {
    SnackBar snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          "$message",
          style:
              const TextStyle(color: Colors.white, backgroundColor: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  loginUserNotExist(context) {
    const SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Given String is empty or null",
          style: TextStyle(color: Colors.white, backgroundColor: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  loginPassword(context) {
    const SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Your password is incorrect",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  loginPasswordFormat(context) {
    const SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Your password is badly formatted",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  registerMatch(context) {
    const SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Your passwords match",
          style: TextStyle(color: Colors.green),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  registerMatchNot(context) {
    const SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Your passwords don't match",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  registerError1(context) {
    const SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Error with Sign Up",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }
}
