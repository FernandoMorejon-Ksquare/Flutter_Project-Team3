import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/books/controller/alert_manager.dart';
import 'package:project3_appforbooks/features/books/screens/favorites_screen.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  static const String routeName = 'books screen';

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool isEnabled = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth fb = FirebaseAuth.instance;
  Map<String, dynamic> favoriteLink = {"favoritesList": []};
  List<dynamic> favoritesList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final ref = await db.collection("users").doc(fb.currentUser?.uid).get();
      final docSnap = ref.data();
      favoritesList = docSnap?["favoritesList"];
      if (favoritesList.contains(args["selfLink"])) {
        isEnabled = true;
      } else {
        isEnabled = false;
      }
    });
  }

  enableFavoritesButton() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final ref = await db.collection("users").doc(fb.currentUser?.uid).get();
      final docSnap = ref.data();
      favoritesList = docSnap?["favoritesList"];
      if (favoritesList.contains(args["selfLink"])) {
        isEnabled = true;
      } else {
        isEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    enableFavoritesButton();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 290,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: args["image"] != "assets/no-image-icon-23494.png"
                        ? Image.network(
                            args["image"],
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/no-image-icon-23494.png",
                            fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                args["title"],
                style: const TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                args["author"],
                style: const TextStyle(
                    fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text(
                args["description"] ?? "No description",
                style: const TextStyle(fontSize: 15.0),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(
                  left: 32.0, right: 32.0, top: 16.0, bottom: 8),
              child: isEnabled
                  ? ElevatedButton(
                      onPressed: () {
                        // AlertManager().displaySnackBar(
                        //     context, "Book already in favorites");
                        Navigator.pushNamed(context, FavoriteScreen.routeName);
                      },
                      child: const Text(
                        "Go to favorites",
                        style: TextStyle(fontSize: 24.0),
                      ))
                  : ElevatedButton(
                      onPressed: () {
                        if (favoritesList.contains(args["selfLink"]) != true) {
                          favoritesList.add(args["selfLink"]);
                          AlertManager().displaySnackBar(
                              context, "Book added to favorites");
                          setState(() {
                            favoriteLink["favoritesList"] = favoritesList;
                            enableFavoritesButton();
                            // fetchFavoriteList();
                            isEnabled = true;
                          });
                          db
                              .collection("users")
                              .doc(fb.currentUser?.uid)
                              .set(favoriteLink);
                        } else {
                          AlertManager().displaySnackBar(
                              context, "Book already in favorites");
                          isEnabled = false;
                        }
                      },
                      child: const Text(
                        "Add to favorites",
                        style: TextStyle(fontSize: 24.0),
                      )),
            ),
          ]),
        ),
      ),
    );
  }
}
