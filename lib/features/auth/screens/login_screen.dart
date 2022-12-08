import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALEXANDRIA"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(children: [
            const Text("All Books and E-Books"),
            Image.asset(
              "Flutter_Project-Team3/lib/core/common/assets/Portrait.jpg",
              height: 200,
            ),
            const Text("Email"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
            ),
            const Text("Password"),
            TextFormField(
              obscureText: true,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Sign Up")),
            ElevatedButton(onPressed: () {}, child: const Text("Log In"))
          ]),
        ),
      ),
    );
  }
}
