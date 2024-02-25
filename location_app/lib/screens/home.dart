import "package:flutter/material.dart";
import "package:location_app/screens/child/child_home.dart";
import "package:location_app/screens/parent/parent_home.dart";
import "package:location_app/services/auth.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sizedbox = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    final auth = Authenticate();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location App"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                await auth.signout();
              },
              child: const Text("Logout"))
        ],
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 250,
          ),
          const Text(
            "Are you a:",
            style: TextStyle(fontFamily: 'Roboto', fontSize: 40),
          ),
          sizedbox,
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ParentHome(),
                ));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue[800]),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              child: const Text(
                "Parent",
                style: TextStyle(
                    fontSize: 45, color: Color.fromARGB(255, 255, 225, 225)),
              )),
          sizedbox,
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChildHome(),
                ));
              },
              style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 0, horizontal: 30)),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue[800]),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              child: const Text(
                "Child",
                style: TextStyle(
                    fontSize: 45, color: Color.fromARGB(255, 255, 225, 225)),
              ))
        ]),
      ),
    );
  }
}
