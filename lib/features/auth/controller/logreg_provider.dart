import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';

class AuthServiceProvider extends ChangeNotifier {
  String validateEmail(String email) {
    String emailMessage = "";
    if (email.isEmpty) {
      emailMessage = "";
    } else if (!EmailValidator.validate(email, true, true)) {
      emailMessage = "Invalid Email Address";
    } else {
      emailMessage = "";
    }
    notifyListeners();
    return emailMessage;
  }

  Future<void> loginFirebase(context, String email, String password) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      return "OK";
    }).catchError((e) {
      String message = e.message;
      var snackBar = SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.red,
            ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return message;
    });
  }

  Future<void> registerFirebase(String firstName, String lastName,
      BuildContext context, String email, String password) async {
    FirebaseAuth fb = FirebaseAuth.instance;
    fb
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      User userLoged = fb.currentUser!;
      userLoged.updateDisplayName("$firstName $lastName");

      Map<String, dynamic> dbUser = {
        "favoritesList": [""]
      };
      CollectionReference<Map<String, dynamic>> db =
          FirebaseFirestore.instance.collection("users");
      FirebaseFirestore.instance
          .collection("users")
          .doc(userLoged.uid)
          .set(dbUser);
      List<String> deleted = [""];
      final deleteItem = <String, dynamic>{
        "favoritesList": FieldValue.arrayRemove(deleted),
      };
      db.doc(fb.currentUser?.uid).update(deleteItem);
    }).catchError((e) {});
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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
