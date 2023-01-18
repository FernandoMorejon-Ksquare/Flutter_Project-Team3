// import 'package:flutter/material.dart';
// import '../../books/screens/book_screen.dart';
// import '../controller/book_services.dart';

// class HomeModel {
//   homeModel(context, String search, ScrollController controller) {
//     return SafeArea(
//       child: FutureBuilder(
//           future: BookServices().getAllBooks(search, index),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var books = snapshot.data!["items"];
//               return ListView.builder(
//                   controller: controller,
//                   itemCount: books.length + 1,
//                   itemBuilder: (context, index) {
//                     if (index < books.length) {
//                       final book = books[index]["volumeInfo"];
//                       return InkWell(
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             BookDetailsScreen.routeName,
//                             arguments: {
//                               "title": book["title"],
//                               "author": book["authors"] != null
//                                   ? book["authors"][0]
//                                   : "No authors",
//                               "image": book["imageLinks"] != null
//                                   ? book["imageLinks"]["thumbnail"]
//                                   : "assets/no-image-icon-23494.png",
//                               "description":
//                                   book["description"] ?? "No description",
//                             },
//                           );
//                         },
//                         child: Card(
//                           child: ListTile(
//                             title: Text(book["title"]),
//                             subtitle: Text(book["authors"] != null
//                                 ? book["authors"][0]
//                                 : "No authors"),
//                             leading: IconButton(
//                               icon: book["imageLinks"] != null
//                                   ? Image.network(
//                                       book["imageLinks"]["thumbnail"])
//                                   : Image.asset(
//                                       "assets/no-image-icon-23494.png"),
//                               onPressed: () {},
//                             ),
//                           ),
//                         ),
//                       );
//                     } else {
//                       return const Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     }
//                     ;
//                   });
//             }
//             if (snapshot.hasError) {
//               return const Center(child: Text("Something went wrong"));
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }

//   // loadMore(context, search) {
//   //   BookServices().loadMore(context, search);
//   //   BookServices().getAllBooks(context, search);
//   // }
// }
