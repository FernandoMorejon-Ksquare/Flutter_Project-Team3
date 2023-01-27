import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/auth/controller/logreg_provider.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl = TextEditingController();

  bool isEnabled = false;

  late String passMatcher = "";
  late String passMatcher2 = "";
  late String firstNameCheck;
  late String lastNameCheck;
  late String emailCheck;

  @override
  Widget build(BuildContext context) {
    final snackBarServiceProvider =
        Provider.of<SnackbarServiceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Alexandria"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24),
          child: Form(
            key: formKey,
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
                controller: _firstNameCtrl,
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
                controller: _lastNameCtrl,
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) {
                  AuthServiceProvider().validateEmail(email);
                  if (AuthServiceProvider().validateEmail(email) ==
                      "Invalid Email Address") {
                    setState(() {
                      isEnabled = false;
                    });
                  } else {
                    setState(() {
                      isEnabled = true;
                    });
                  }
                },
                controller: _emailCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Email Adress'),
              ),
              Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    AuthServiceProvider().validateEmail(_emailCtrl.text),
                    style: const TextStyle(color: Colors.red),
                  )),
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
                onChanged: (value) {
                  passMatcher = value;
                },
                controller: _passwordCtrl,
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
                controller: _confirmPasswordCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password again'),
                obscureText: true,
                onChanged: (value) {
                  passMatcher2 = value;
                  if (passMatcher != passMatcher2) {
                    snackBarServiceProvider.registerMatchNot(context);
                  } else if (passMatcher == passMatcher2) {
                    snackBarServiceProvider.registerMatch(context);
                  } else {
                    null;
                  }
                },
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 32, right: 32, top: 16),
                  child: ElevatedButton(
                      style: isEnabled
                          ? null
                          : ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey,
                            )),
                      onPressed: isEnabled
                          ? () {
                              if (passMatcher == passMatcher2 &&
                                  passMatcher2.isNotEmpty) {
                                AuthServiceProvider().registerFirebase(
                                    _firstNameCtrl.text,
                                    _lastNameCtrl.text,
                                    context,
                                    _emailCtrl.text,
                                    _passwordCtrl.text);
                              } else {
                                snackBarServiceProvider.registerError1(context);
                              }
                            }
                          : null,
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
      )),
    );
  }
}
