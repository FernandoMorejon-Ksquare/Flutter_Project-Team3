import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project3_appforbooks/features/auth/controller/auth_provider.dart';
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

  Map<String, bool> favorites = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameCtrl.addListener(() {
      setState(() {
        submit = _firstNameCtrl.text.isNotEmpty;
      });
    });
  }

  late String
      passMatcher; // Added late keyword and the type of variable and String type.
  late String
      passMatcher2; // Added late keyword and the type of variable and String type.

  Future<void> registerFirebase() async {
    FirebaseAuth fb = FirebaseAuth.instance;
    fb
        .createUserWithEmailAndPassword(
            email: _emailCtrl.text, password: _passwordCtrl.text)
        .then((value) async {
      User _user = fb.currentUser!; // variable to reduce same code.
      _user.updateDisplayName("${_firstNameCtrl.text} ${_lastNameCtrl.text}");
      Map<String, dynamic> dbUser = {
        "userID": _user.uid
      }; // map to with userID.
      FirebaseFirestore.instance
          .collection("users")
          .doc(_user.uid)
          .set(dbUser); // adding userID to users collection on database
    }).catchError((e) {});
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  bool disableButton = false;
  @override
  Widget build(BuildContext context) {
    final snackbarServiceProvider =
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
                    snackbarServiceProvider.registerMatch(context);
                  } else if (passMatcher == passMatcher2) {
                    snackbarServiceProvider.registerMatch2(context);
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
                      style: const ButtonStyle(),
                      onPressed: submit
                          ? () {
                              if (passMatcher == passMatcher2) {
                                registerFirebase();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Your passwords don't match")));
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
