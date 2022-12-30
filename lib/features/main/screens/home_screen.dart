import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/controller/book_services.dart';
import 'package:project3_appforbooks/features/user/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'main';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

        actions: [],
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(titles[index]),
              subtitle: Text(subtitles[index]),
            ),
          );
        },

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
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Card(
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
                      );
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
