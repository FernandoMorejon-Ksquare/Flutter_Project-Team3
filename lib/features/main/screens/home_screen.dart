import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/controller/book_controller.dart';
import 'package:project3_appforbooks/features/main/models/book_model.dart';
import 'package:project3_appforbooks/features/user/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'main';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titles = [
    'El psicoanalista',
    'Corazón Delator',
    'La llamada de Cthullhu',
    'El psicoanalista',
    'Corazón Delator',
    'La llamada de Cthullhu',
    'El psicoanalista',
    'Corazón Delator',
    'La llamada de Cthullhu'
  ];

  final subtitles = [
    'libro 1',
    'libro 2',
    'libro 3',
    'libro 1',
    'libro 2',
    'libro 3',
    'libro 1',
    'libro 2',
    'libro 3'
  ];

  @override
  Widget build(BuildContext context) {
    BookController controller = BookController();
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
            icon: Image.network('https://picsum.photos/200'), // Replace image.
            onPressed: () {
              Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
            },
            iconSize: 64,
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: controller.getBooks.length,
          itemBuilder: (context, index) {
            BookModel item = controller.getBooks[index];
            return Card(
              child: ListTile(
                title: Text(item.title ?? "Title"),
                subtitle: Text(item.author ?? "Author"),
                leading: IconButton(
                  icon: Image.network(
                      item.thumbnailUrl ?? "https://picsum.photos/200"),
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
