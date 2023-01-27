// This will be the provider implemented to handle the favorite books through all the app.
// It is still not workin.
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:project3_appforbooks/features/books/models/favorite_model.dart';
import '../../main/models/book_model.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> favoritesList = [];
  List<Book> favoritesBooks = [];

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
        favoritesBooks.add(favoriteBook);
      }
    }
  }

  @override
  notifyListeners();
}
