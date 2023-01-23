import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../books/screens/favorites_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String routeName = 'profile screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _email = "";
  String _name = "";

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _email = user.email.toString();
          _name = user.displayName.toString();
        });
      }
    });

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile Screen"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 64.0,
                    ),
                    Image.asset("assets/lion.jpg", fit: BoxFit.fitWidth),
                    const SizedBox(
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        _name != "" ? _name : "First and last name",
                        style: const TextStyle(fontSize: 48.0),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        _email != "" ? _email : "Email",
                        style: const TextStyle(fontSize: 28.0),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                        height: 50,
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 32.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, FavoriteScreen.routeName);
                            },
                            child: const Text(
                              "Go to Favorites",
                              style: TextStyle(fontSize: 24.0),
                            ))),
                  ]),
            ),
          ),
        ));
  }
}
