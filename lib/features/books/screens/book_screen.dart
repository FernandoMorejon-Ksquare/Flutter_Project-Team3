import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  static const String routeName = 'books screen';

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
                    child:
                        Image.asset("assets/Portrait.jpg", fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Book Title",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Author Name",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Description",
                style: TextStyle(fontSize: 24.0),
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
                    onPressed: () {},
                    child: const Text(
                      "Add to Favorites",
                    ))),
          ]),
        ),
      ),
    );
  }
}
