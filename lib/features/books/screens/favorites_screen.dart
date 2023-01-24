import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../main/models/book_model.dart';
import '../models/favorite_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static const String routeName = 'favorite';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Book> favoritesBooks = []; // Variable to save favorites books.
  List<String> favoritesList = []; // Favorites list url strings.

  // This function add the favorites books connecting to the database and get the favorite list with the model of favorite book
  // then pass this model to book models to have a list of the favorite books to render it.
  fetchFavoriteList(List<String> favoritesList) async {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection("users");
    FirebaseAuth fb = FirebaseAuth.instance;
    final ref = db.doc(fb.currentUser?.uid).withConverter(
        fromFirestore: FavoriteBook.fromFirestore,
        toFirestore: (FavoriteBook favoriteBook, _) =>
            favoriteBook.toFirestore());
    final docSnap = await ref.get();
    final favoriteBook = docSnap.data();
    if (favoriteBook != null) {
      for (var element in favoriteBook.favoritesList!) {
        Uri url = Uri.parse(element);
        Response response = await http.get(url);
        dynamic responseDecoded = json.decode(response.body);
        Book favoriteBook = Book.fromJson(responseDecoded);
        setState(() {
          favoritesBooks.add(favoriteBook);
        });
      }
    }
  }

  // Function that request the database to delete a specific item of the favorites list.
  deleteFromFavoriteList(String item) {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection("users");
    FirebaseAuth fb = FirebaseAuth.instance;
    List<String> deleted = [item];
    final deleteItem = <String, dynamic>{
      "favoritesList": FieldValue.arrayRemove(deleted),
    };
    // final ref =
    db.doc(fb.currentUser?.uid).update(deleteItem);
  }

  // Initialize the widget calling the favorites books.
  @override
  void initState() {
    super.initState();
    fetchFavoriteList(favoritesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Favorites')),
      body: ListView.builder(
        // item count will be the favorites book amount.
        itemCount: favoritesBooks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                // Title text will be the favorite book title.
                title: Text(favoritesBooks[index].title.toString()),
                // Subtitle text will be the favorite book author.
                subtitle: Text(favoritesBooks[index].author.toString()),
                leading: IconButton(
                  // Icon will be the image of the book, if there is no image the image with no image will be displayed.
                  icon: favoritesBooks[index].thumbnail.toString() !=
                          "assets/no-image-icon-23494.png"
                      ? Image.network(
                          favoritesBooks[index].thumbnail.toString())
                      : Image.asset("assets/no-image-icon-23494.png"),
                  onPressed: () {},
                ),
                trailing: InkWell(
                  onTap: () {
                    // refresh the state when an item is being removed from favorites.
                    setState(() {
                      // delete from the database and then delete from local screen.
                      deleteFromFavoriteList(
                          favoritesBooks[index].selfLink.toString());
                      favoritesBooks.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                )),
          );
        },
      ),
    );
  }
}
