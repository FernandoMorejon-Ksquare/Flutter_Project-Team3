import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              const Text("First Name"),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Last Name'),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Email"),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Email Adress'),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Password",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Confirm your Password"),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
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
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      ))),
              TextButton(
                  onPressed: () {},
                  child: const Text("Already have an account?"))
            ]),
          ),
        ),
      ),
    );
  }
}
