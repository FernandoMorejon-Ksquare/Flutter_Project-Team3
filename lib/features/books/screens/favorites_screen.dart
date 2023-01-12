import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static const String routeName = 'favorite';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final titles = [
    'El psicoanalista',
    'Corazón Delator',
    'La llamada de Cthullhu'
  ];

  final subtitles = ['libro 1', 'libro 2', 'libro 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Favorites')),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(titles[index]),
                subtitle: Text(subtitles[index]),
                leading: IconButton(
                  icon: Image.asset('assets/lion.jpg'),
                  onPressed: () {},
                ),
                trailing: InkWell(
                  onTap: () {
                    setState(() {
                      titles.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                )),
          );
        },
      ),
    );
  }
}
