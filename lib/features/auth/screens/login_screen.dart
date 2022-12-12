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
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                "All Books and E-Books",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 200,
              ),
              Container(),
              // Image.asset(
              //     "Flutter_Project-Team3/lib/core/common/assets/Portrait.jpg",
              //     fit: BoxFit.fitWidth),
              const Text("Email"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Email Adress'),
                keyboardType: TextInputType.emailAddress,
              ),
              const Text("Password"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password'),
                obscureText: true,
              ),
              Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 64, right: 64, top: 24),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Log In"))),
              Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 64, right: 64, top: 16),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Sign Up"))),
              TextButton(
                  onPressed: () {}, child: const Text("Forgot your password?"))
            ]),
          ),
        ),
      ),
    );
  }
}
