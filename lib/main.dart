import 'package:flutter/material.dart';
import 'package:project3_appforbooks/core/common/styles/theme.dart';
import 'package:project3_appforbooks/features/auth/screens/favorites_screen.dart';
import 'package:project3_appforbooks/features/auth/screens/home_screen.dart';
import 'package:project3_appforbooks/features/auth/screens/login_screen.dart';
import 'package:project3_appforbooks/features/auth/screens/profile_screen.dart';
import 'package:project3_appforbooks/features/auth/screens/register_screen.dart';


import 'features/profile/profile_screen.dart';


import 'features/auth/screens/book_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alexandria Books',
      theme: CustomTheme().theme,
      home:  HomeScreen(),
      home: const BookDetailsScreen(),

    );
  }
}
