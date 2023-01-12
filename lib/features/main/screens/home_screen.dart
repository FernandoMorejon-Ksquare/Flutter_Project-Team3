import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/controller/search_manager.dart';
import 'package:project3_appforbooks/features/main/models/home_model.dart';
import 'package:project3_appforbooks/features/main/models/title_model.dart';
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
    String search =
        SearchManager().query == "" ? "action" : SearchManager().query;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleModel().titleModel(context, search),
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
      body: HomeModel().homeModel(context, search),
    );
  }
}
