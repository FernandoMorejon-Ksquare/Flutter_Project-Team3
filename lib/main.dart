import 'package:flutter/material.dart';
import 'package:project3_appforbooks/core/common/styles/theme.dart';
import 'package:project3_appforbooks/features/auth/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme().theme,
      home: const LoginScreen(),
    );
  }
}
