import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project3_appforbooks/features/auth/controller/logreg_provider.dart';

import 'package:project3_appforbooks/features/auth/screens/register_screen.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailctrl = TextEditingController();
  final TextEditingController _passwordctrl = TextEditingController();

  bool isEnabled = false;
  final formkey = GlobalKey<FormState>();

// VALIDATING FORM
  void validateform() {
    final form = formkey.currentState;
    form?.validate();
  }

  Future<String?> loginFirebase() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailctrl.text, password: _passwordctrl.text)
        .then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      var snackbar = const SnackBar(
          duration: Duration(seconds: 2),
          content: Text(
            "Loading...",
            style: TextStyle(
              color: Colors.green,
            ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return "OK";
    }).catchError((e) {
      String message = e.message;
      var snackbar = SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.red,
            ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      return message;
    });
  }

  @override
  Widget build(BuildContext context) {
    final snackbarServiceProvider = SnackbarServiceProvider();
    return Scaffold(
        appBar: AppBar(
          title: const Text("ALEXANDRIA"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          margin: const EdgeInsets.only(right: 16, left: 16),
          child: Form(
              key: formkey,
              child: Column(children: [
                const SizedBox(
                  height: 32,
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset("assets/Portrait.jpg", fit: BoxFit.fitWidth),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 32, left: 32),
                  child: TextFormField(
                    validator:
                        EmailValidator(errorText: 'Enter a valid Email Adress'),
                    controller: _emailctrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Email Adress'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 32, left: 32),
                  child: TextFormField(
                    controller: _passwordctrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Password'),
                    obscureText: true,
                  ),
                ),
                Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 32, right: 32, top: 32),
                    child: ElevatedButton(
                        onPressed: () {
                          loginFirebase();
                        },
                        child: const Text(
                          "Log In",
                        ))),
                Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 32, right: 32, top: 16),
                    child: ElevatedButton(
                        onPressed: isEnabled
                            ? () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              }
                            : null,
                        child: const Text("Sign Up"))),
                TextButton(
                    onPressed: () {},
                    child: const Text("Forgot your password?")),
              ])),
        ))));
  }
}
