import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/books/screens/book_screen.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';
import 'package:project3_appforbooks/features/user/profile_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';
import 'features/books/screens/favorites_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final name = settings.name;

  return MaterialPageRoute(
    builder: routes[name]!,
    settings: settings,
  );
}

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  RegisterScreen.routeName: (ctx) => const RegisterScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  BookDetailsScreen.routeName: (ctx) => const BookDetailsScreen(),
  ProfileScreen.routeName: (ctx) => const ProfileScreen(),
  FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
};
