import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project3_appforbooks/features/auth/controller/logreg_provider.dart';
import 'package:project3_appforbooks/features/auth/controller/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool enableBtn = false;
  final formkey = GlobalKey<FormState>();

  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl = TextEditingController();

  bool submit = false;
  bool submitButton = false;

  @override
  void initState() {
    super.initState();
    _firstNameCtrl.addListener(() {
      setState(() {
        submit = _firstNameCtrl.text.isNotEmpty;
      });
    });
  }

  var passMatcher;
  var passMatcher2;

//Remember to remove prints.
  registerFirebase() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      print("User created.");
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }).catchError((e) {
      print("Error: ");
      print(e);
    });
  }

  bool disableButton = false;
  @override
  Widget build(BuildContext context) {
    final authServiceProvider = Provider.of<AuthServiceProvider>(context);
    final snackbarServiceProvider =
        Provider.of<SnackbarServiceProvider>(context);
    //final buttonProvider = Provider.of<buttonProvider>(context);

    bool isActive = false;
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
            key: formkey,
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
                validator: requiredValidator,
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
                validator: requiredValidator,
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
                validator:
                    EmailValidator(errorText: 'Enter a valid Email Adress'),
                controller: _emailCtrl,
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
                onChanged: (value) {
                  passMatcher = value;
                },
                validator: passwordValidator,
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
                validator: passwordValidator,
                controller: _confirmPasswordCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password again'),
                obscureText: true,
                onChanged: (value) {
                  passMatcher2 = value;
                  if (passMatcher != passMatcher2) {
                    snackbarServiceProvider.registerMatchNot(context);
                  } else if (passMatcher == passMatcher2) {
                    snackbarServiceProvider.registerMatch(context);
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
                      style: ButtonStyle(),
                      onPressed: submit
                          ? () {
                              if (passMatcher == passMatcher2) {
                                registerFirebase();
                              } else {
                                snackbarServiceProvider.registerError1(context);
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
