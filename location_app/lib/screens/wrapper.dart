import "package:flutter/material.dart";
import "package:location_app/screens/authentication/authpage.dart";
import 'package:location_app/screens/home.dart';
import "package:provider/provider.dart";
import "package:firebase_auth/firebase_auth.dart";

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final homepagekey = GlobalKey<State<HomePage>>();
  int child = 0;
  void changer(int val) {
    child = val;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) return const AuthPage();
    // if (child == 1) return const ParentHome();
    // if (child == 2) return const ChildHome();
    return const HomePage();
  }
}
