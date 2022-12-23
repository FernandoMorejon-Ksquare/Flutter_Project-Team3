import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String routeName = 'profile screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
        title: const Text("Profile Screen"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 24.0, right: 24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 64.0,
              ),
              Image.asset("assets/Portrait.jpg", fit: BoxFit.fitWidth),
              const SizedBox(
                height: 64,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Text(
                  "First Name",
                  style: TextStyle(fontSize: 48.0),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Text(
                  "Last Name",
                  style: TextStyle(fontSize: 48.0),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 48.0),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Go to Favorites",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ))),
            ]),
          ),
        ),
      ),
    );
  }
}
