import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';

class ValidationProvider extends ChangeNotifier {
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  final requiredValidator =
      RequiredValidator(errorText: 'this field is required');

  final passwordMatchValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character'),
  ]);
}

class FireBaseProvider extends ChangeNotifier {
  BuildContext get context => (context);

  registerFirebase() async {
    final TextEditingController firstNameCtrl = TextEditingController();
    final TextEditingController lastNameCtrl = TextEditingController();
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passwordCtrl = TextEditingController();
    final TextEditingController confirmPasswordCtrl = TextEditingController();

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailCtrl.text, password: passwordCtrl.text)
        .then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }).catchError((e) {});
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
