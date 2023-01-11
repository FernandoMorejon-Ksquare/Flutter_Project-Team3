import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/books/screens/favorites_screen.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  static const String routeName = 'books screen';

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 450,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(args["image"], fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                args["title"],
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                args["author"],
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                args["description"],
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
                height: 50,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FavoriteScreen.routeName);
                    },
                    child: const Text(
                      "Add to Favorites",
                    ))),
          ]),
        ),
      ),
    );
  }
}
