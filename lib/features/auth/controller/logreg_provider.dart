import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';

class AuthServiceProvider extends ChangeNotifier {
  TextEditingController _firstNameCtrl = TextEditingController();
  TextEditingController _lastNameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _confirmPasswordCtrl = TextEditingController();

  registerFirebase(context) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }).catchError((e) {
      String err = e.message;
      if (e.message == "Given String is empty or null") {}
      return err;
    });
  }
}

class SnackbarServiceProvider extends ChangeNotifier {
  loginUser(context, message) {
    var snackbar = SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          "$message",
          style:
              const TextStyle(color: Colors.white, backgroundColor: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    notifyListeners();
  }

  loginUserNotExist(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Given String is empty or null",
          style: TextStyle(color: Colors.white, backgroundColor: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    notifyListeners();
  }

  loginPassword(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Your password is incorrect",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    notifyListeners();
  }

  loginPasswordFormat(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Your password is badly formatted",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    notifyListeners();
  }

  registerMatch(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Your passwords match",
          style: TextStyle(color: Colors.green),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    notifyListeners();
  }

  registerMatchNot(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Your passwords don't match",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    notifyListeners();
  }

  registerError1(context) {
    const snackbar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Error with Sign Up",
          style: TextStyle(color: Colors.red),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    notifyListeners();
  }
}
