import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/books/screens/favorites_screen.dart';
import 'package:project3_appforbooks/features/main/controller/book_details_provider.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  static const String routeName = 'books screen';

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool isEnabled = false;

// This will be used when the function fetchFavorites get refactored.
  // CollectionReference<Map<dynamic, dynamic>> db = FirebaseFirestore.instance
  //     .collection("users"); // variable to use database

  FirebaseFirestore db = FirebaseFirestore.instance; // variable to use database
  FirebaseAuth fb = FirebaseAuth.instance; // variable to acces user auth data.
  Map<String, dynamic> favoriteLink = {
    "favoritesList": []
  }; // map to add favorite list to database.
  dynamic favoritesList = []; // list to add favorite links.

  Future<void> fetchFavoriteList() async {
    // function to read current favorites links of the user.
    late Map<String, dynamic> data;
    db
        .collection("users")
        .doc(fb.currentUser?.uid)
        .get()
        .then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      favoritesList = data["favoritesList"];
    });
  }

  //  // read current favorites

  @override
  Widget build(BuildContext context) {
    fetchFavoriteList();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    isEnabled = favoritesList.isNotEmpty;
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
                    ? AddFavoritesButton(
                        args: args,
                        db: db,
                        fb: fb,
                        favoritesList: favoritesList,
                        favoriteLink: favoriteLink,
                        fetchFavoriteList: fetchFavoriteList)
                    : GoToFavoritesButton()),
          ]),
        ),
      ),
    );
  }
}

