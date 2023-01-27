// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project3_appforbooks/features/books/controller/alert_manager.dart';
// import 'package:project3_appforbooks/features/books/screens/favorites_screen.dart';

// class AddFavoritesButton extends StatefulWidget {
//   final dynamic favoritesList;
//   late Function fetchFavoriteList;
//   Map<String, dynamic> args;
//   FirebaseFirestore db;
//   FirebaseAuth fb;
//   Map<String, dynamic> favoriteLink;

//   AddFavoritesButton(
//       {super.key,
//       required this.args,
//       required this.db,
//       required this.fb,
//       required this.favoritesList,
//       required this.favoriteLink,
//       required this.fetchFavoriteList});

//   @override
//   State<AddFavoritesButton> createState() => _AddFavoritesButtonState();
// }

// class _AddFavoritesButtonState extends State<AddFavoritesButton> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         child: const Text(
//           "Add to Favorites",
//           style: TextStyle(fontSize: 24),
//         ),
//         onPressed: () {
//           widget.favoritesList.add(widget.args["selfLink"]);
//           AlertManager().displaySnackBar(context, "Book added to favorites");

//           setState(() {
//             widget.favoriteLink["favoritesList"] = widget
//                 .favoritesList; // add favorite list to the map that will allow to upload it to the database.
//             widget.fetchFavoriteList();
//           });
//           widget.db
//               .collection("users")
//               .doc(widget.fb.currentUser?.uid)
//               .set(widget.favoriteLink); // add favorite link to database.
//         });
//   }
// }

// class GoToFavoritesButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.pushNamed(context, FavoriteScreen.routeName);
//       },
//       child: const Text("Go to Favorites"),
//     );
//   }
// }
