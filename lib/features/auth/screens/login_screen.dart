import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project3_appforbooks/features/auth/screens/register_screen.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailctrl = TextEditingController();
  final TextEditingController _passwordctrl = TextEditingController();

  // ignore: non_constant_identifier_names
  loginFirebase() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailctrl.text, password: _passwordctrl.text)
        .then((value) {
      print("Credentials were introduced.");
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }).catchError((e) {
      print("Error:");
      print(e);
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: const Text("Sign Up"))),
              TextButton(
                  onPressed: () {}, child: const Text("Forgot your password?"))
            ]),
          ),
        ),
      ),
    );
  }
}
