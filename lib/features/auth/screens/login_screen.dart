import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/auth/controller/logreg_provider.dart';
import 'package:project3_appforbooks/features/auth/screens/register_screen.dart';

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
                    controller: _emailCtrl,
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Email Adress'),
                    keyboardType: TextInputType.emailAddress,
                  ),
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
                Container(
                  margin: const EdgeInsets.only(right: 32, left: 32),
                  child: TextFormField(
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
                        style: isEnabled
                            ? null
                            : ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                Colors.grey,
                              )),
                        onPressed: isEnabled
                            ? () {
                                AuthServiceProvider().loginFirebase(context,
                                    _emailCtrl.text, _passwordCtrl.text);
                              }
                            : null,
                        child: const Text(
                          "Log In",
                        ))),
                Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 32, right: 32, top: 16),
                    child: ElevatedButton(
                        onPressed: isEnabled
                            ? null
                            : () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              },
                        child: const Text("Sign Up"))),
              ])),
        ))));
  }
}
