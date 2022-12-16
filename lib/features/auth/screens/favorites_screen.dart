import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({super.key});
final titles = ['El psicoanalista','Corazón Delator', 'La llamada de Cthullhu'];
final subtitles = ['libro 1','libro 2','libro 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar( centerTitle:true,title:const Text('Favorites')),
      body: ListView.builder(itemCount:titles.length,itemBuilder: (context, index) {
        return Card(
          child: ListTile(title: Text(titles[index]), subtitle: Text(subtitles[index])
          ,leading:IconButton( icon: Image.asset('shrek.png'),onPressed: () {}, ),
          trailing:const Icon(Icons.star)),
          
        );
      },
      ),
    );
  }
}