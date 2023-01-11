import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/books/screens/book_screen.dart';
import 'package:project3_appforbooks/features/main/controller/book_services.dart';
import 'package:project3_appforbooks/features/user/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'main';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final ScrollController _lazyController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();

  //   _lazyController.addListener(() {
  //     if (_lazyController.position.maxScrollExtent == _lazyController.offset) {
  //       print("JHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJHJH");
  //       BookServices().loadMore();
  //       BookServices().getAllBooks(context);
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _lazyController.dispose();
  //   super.dispose();
  // }

  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Books on Action'), // Remember to replace Action for $genreType.
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/lion.jpg',
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
            },
            iconSize: 64,
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: BookServices().getAllBooks(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var books = snapshot.data!["items"];
                return ListView.builder(
                    // controller: _lazyController,
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
                                "author": books[index]["volumeInfo"]
                                            ["authors"] !=
                                        null
                                    ? books[index]["volumeInfo"]["authors"][0]
                                    : "No authors",
                                "image": books[index]["volumeInfo"]
                                    ["imageLinks"]["thumbnail"],
                                "description": books[index]["searchInfo"]
                                        ["textSnippet"] ??
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
                                icon: Image.network(books[index]["volumeInfo"]
                                    ["imageLinks"]["thumbnail"]),
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
      ),
    );
  }
}
