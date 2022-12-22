import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/auth/screens/book_screen.dart';
import 'package:project3_appforbooks/features/auth/screens/profile_screen.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';

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
  BookDetailsScreen.routeName: (ctx) => const BookDetailsScreen(),
  ProfileScreen.routeName: (ctx) => const ProfileScreen(),
};
