import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project3_appforbooks/features/auth/controller/validation.dart';
import 'package:project3_appforbooks/features/auth/screens/register_screen.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  bool isEnabled = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// VALIDATING FORM
  void validateForm() {
    final FormState? form = formKey.currentState;
    form?.validate();
  }

// Type of the function return is void, not a String.
  Future<void> loginFirebase() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      SnackBar snackBar = const SnackBar(
          duration: Duration(seconds: 2),
          content: Text(
            "Loading...",
            style: TextStyle(
              color: Colors.green,
            ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  @override
  Widget build(BuildContext context) {
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
              key: formKey,
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
                    controller: _emailCtrl,
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
                    validator: passwordValidator,
                    controller: _passwordCtrl,
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
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: const Text("Sign Up"))),
                // Commented until forgot password function gets implemented.

                // TextButton(
                //     onPressed: () {},
                //     child: const Text("Forgot your password?")),
              ])),
        ))));
  }
}
