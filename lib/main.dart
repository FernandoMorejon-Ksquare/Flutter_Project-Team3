import 'package:flutter/material.dart';
import 'package:project3_appforbooks/core/common/styles/theme.dart';
import 'package:project3_appforbooks/features/auth/controller/auth_provider.dart';
import 'package:project3_appforbooks/features/auth/screens/login_screen.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';
import 'package:project3_appforbooks/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
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
      ChangeNotifierProvider(create: (_) => SnackbarServiceProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alexandria Books',
      //theme: CustomTheme().theme,
      onGenerateRoute: onGenerateRoute,
      home: const LoginScreen(),

    );
  }
}
