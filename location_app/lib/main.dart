import 'package:flutter/material.dart';
import 'package:location_app/screens/home.dart';
import 'package:location_app/screens/mappage.dart';
import 'package:location_app/services/determinepositon.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationTracker(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
          "/actualmap": (context) => const MapPage(),
        },
      ),
    );
  }
}
