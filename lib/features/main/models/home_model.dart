import 'package:flutter/material.dart';
import '../../books/screens/book_screen.dart';
import '../controller/book_services.dart';

class HomeModel {
  homeModel(context, String search) {
    return SafeArea(
      child: FutureBuilder(
          future: BookServices().getAllBooks(context, search),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var books = snapshot.data!["items"];
              return ListView.builder(
                  itemCount: books.length + 1,
                  itemBuilder: (context, index) {
                    if (index < books.length) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            BookDetailsScreen.routeName,
                            arguments: {
                              "title": books[index]["volumeInfo"]["title"],
                              "author":
                                  books[index]["volumeInfo"]["authors"] != null
                                      ? books[index]["volumeInfo"]["authors"][0]
                                      : "No authors",
                              "image": books[index]["volumeInfo"]
                                          ["imageLinks"] !=
                                      null
                                  ? books[index]["volumeInfo"]["imageLinks"]
                                      ["thumbnail"]
                                  : "assets/no-image-icon-23494.png",
                              "description": books[index]["volumeInfo"]
                                      ["description"] ??
                                  "No description",
                            },
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(books[index]["volumeInfo"]["title"]),
                            subtitle: Text(
                                books[index]["volumeInfo"]["authors"] != null
                                    ? books[index]["volumeInfo"]["authors"][0]
                                    : "No authors"),
                            leading: IconButton(
                              icon: books[index]["volumeInfo"]["imageLinks"] !=
                                      null
                                  ? Image.network(books[index]["volumeInfo"]
                                      ["imageLinks"]["thumbnail"])
                                  : Image.asset(
                                      "assets/no-image-icon-23494.png"),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    ;
                  });
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
