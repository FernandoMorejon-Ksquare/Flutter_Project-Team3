//This file models the information from the favorite database. It takes the list from the server and pass it to
//the favorite screen in Strings to be able to render the UI.

import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteBook {
  FavoriteBook({
    this.favoritesList,
  });

  List<String>? favoritesList;

  factory FavoriteBook.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    Map<String, dynamic> data = snapshot.data()!;
    return FavoriteBook(
      favoritesList: data["favoritesList"] is Iterable
          ? List.from(data["favoritesList"])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() => {
        if (favoritesList != null) "favoritesList": favoritesList,
      };
}
