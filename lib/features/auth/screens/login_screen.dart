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
                margin: EdgeInsets.only(right: 32, left: 32),
                child: TextFormField(
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
                margin: EdgeInsets.only(right: 32, left: 32),
                child: TextFormField(
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
                      onPressed: () {},
                      child: const Text(
                        "Log In",
                      ))),
              // Container(
              //     height: 50,
              //     width: double.infinity,
              //     margin: const EdgeInsets.only(left: 32, right: 32, top: 32),
              //     child: ElevatedButton.icon(
              //       onPressed: () {},
              //       icon: Image.asset(""),
              //       label: const Text("Log in with Facebook"),
              //     )),
              Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 32, right: 32, top: 16),
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
