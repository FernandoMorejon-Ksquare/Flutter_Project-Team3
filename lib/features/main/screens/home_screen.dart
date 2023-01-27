import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/controller/search_manager.dart';
import 'package:project3_appforbooks/features/main/screens/infinity_books_list.dart';
import 'package:project3_appforbooks/features/user/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'main';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search =
      SearchManager().query == "" ? "action" : SearchManager().query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Books"),
          leading: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchManager());
            },
            icon: const Icon(Icons.search),
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/lion.jpg',
                fit: BoxFit.contain,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              iconSize: 64.0,
            )
          ],
        ),
        body: InfinityBooksList(
          search: search,
        ));
  }
}
