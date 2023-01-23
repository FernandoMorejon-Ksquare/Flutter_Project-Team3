import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/auth/screens/login_screen.dart';
import 'package:project3_appforbooks/features/auth/screens/register_screen.dart';
import 'package:project3_appforbooks/features/main/controller/book_services.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';
import 'package:project3_appforbooks/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/main/models/book_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (_) => ThemeProvider()),
      // ChangeNotifierProvider(create: (_) => AuthServiceProvider()),
      ChangeNotifierProvider(create: (_) => SnackbarServiceProvider()),
      ChangeNotifierProvider(
          create: (_) => BookProvider(BookServices(), false)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alexandria Books',
      //theme: CustomTheme().theme,
      onGenerateRoute: onGenerateRoute,
      home: LoginScreen(),
    );
  }
}
