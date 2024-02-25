import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location_app/screens/parent/mappage.dart';
import 'package:location_app/services/database.dart';
import 'package:provider/provider.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  double latitude = -1;
  double longitude = -1;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).locationstream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            latitude = snapshot.data!.get("latitude");
            longitude = snapshot.data!.get("longitude");
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text("Parent Home"),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  TextButton(
                      onPressed: () {
                        if (latitude != -1 && longitude != -1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapPage(
                                    latitude: latitude, longitude: longitude),
                              ));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.blue),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      child: const Text(
                        "Get Child Location",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
