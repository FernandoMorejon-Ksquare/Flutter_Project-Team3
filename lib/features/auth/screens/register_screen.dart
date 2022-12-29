import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/books/screens/book_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController first_name_ctrl = TextEditingController();
  TextEditingController last_name_ctrl = TextEditingController();
  TextEditingController email_ctrl = TextEditingController();
  TextEditingController password_ctrl = TextEditingController();
  TextEditingController confirm_password_ctrl = TextEditingController();

//Remember to remove prints.
  register_firebase() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email_ctrl.text, password: password_ctrl.text)
        .then((value) {
      print("User created.");
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }).catchError((e) {
      print("Error: ");
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Alexandria"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24),
            child: Column(children: [
              const SizedBox(
                height: 64,
              ),
              const Text(
                "First Name",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: first_name_ctrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your First Name'),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Last Name",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: last_name_ctrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Last Name'),
              ),
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
              TextFormField(
                controller: email_ctrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Email Adress'),
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
              TextFormField(
                controller: password_ctrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Confirm your Password",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: confirm_password_ctrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password again'),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 32, right: 32, top: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        register_firebase();
                      },
                      child: const Text(
                        "Sign Up",
                      ))),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: const Text("Already have an account?"))
            ]),
          ),
        ),
      ),
    );
  }
}
