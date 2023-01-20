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
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String buttonText = "Add to favorites";

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
                    child: args["image"] != "assets/no-image-icon-23494.png"
                        ? Image.network(
                            args["image"],
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/no-image-icon-23494.png",
                            fit: BoxFit.cover),
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
                args["description"] ?? "No description",
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
                    style: ButtonStyle(overlayColor:
                        MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey;
                      } else {
                        return Colors.black;
                      }
                    })),
                    onPressed: () {
                      // setState(() {
                      //   buttonText = "Remove from favorites";
                      // });
                    },
                    child: Text(
                      buttonText,
                      style: const TextStyle(fontSize: 24.0),
                    ))),
          ]),
        ),
      ),
    );
  }
}
