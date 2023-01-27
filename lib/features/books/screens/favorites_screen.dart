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
  List<Book> favoritesBooks = [];
  List<String> favoritesList = [];

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

  deleteFromFavoriteList(String item) {
    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection("users");
    FirebaseAuth fb = FirebaseAuth.instance;
    List<String> deleted = [item];
    final deleteItem = <String, dynamic>{
      "favoritesList": FieldValue.arrayRemove(deleted),
    };
    db.doc(fb.currentUser?.uid).update(deleteItem);
  }

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
        itemCount: favoritesBooks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(favoritesBooks[index].title.toString()),
                subtitle: Text(favoritesBooks[index].author.toString()),
                leading: IconButton(
                  icon: favoritesBooks[index].thumbnail.toString() !=
                          "assets/no-image-icon-23494.png"
                      ? Image.network(
                          favoritesBooks[index].thumbnail.toString())
                      : Image.asset("assets/no-image-icon-23494.png"),
                  onPressed: () {},
                ),
                trailing: InkWell(
                  onTap: () {
                    setState(() {
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
