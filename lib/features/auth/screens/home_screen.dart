import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Alexandria'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        actions: [
          IconButton(
            icon: Image.asset('lion.jpg'),
            onPressed: () {},
            iconSize: 64,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(titles[index]),
              subtitle: Text(subtitles[index]),
              leading: IconButton(
                icon: Image.asset('shrek.png'),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
