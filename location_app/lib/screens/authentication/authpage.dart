import 'package:flutter/material.dart';
import 'package:location_app/screens/authentication/login.dart';
import 'package:location_app/screens/authentication/register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
      },
    );
  }
}
