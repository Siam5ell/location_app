import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:location_app/services/database.dart";
import "package:location_app/services/determinepositon.dart";
import "package:provider/provider.dart";

class ChildHome extends StatefulWidget {
  const ChildHome({super.key});

  @override
  State<ChildHome> createState() => _ChildHomeState();
}

class _ChildHomeState extends State<ChildHome> {
  String val = "";
  @override
  Widget build(BuildContext context) {
    final locate = Provider.of<LocationTracker>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Child Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  await locate.determinePosition();
                  if (locate.currposition != "Unknown") {
                    await DatabaseService(uid: user.uid).updatelocation(
                        locate.currlatitude, locate.currlongitude);
                    setState(() {
                      val = "Location Updated";
                    });
                  } else {
                    setState(() {
                      val = "";
                    });
                  }
                },
                child: const Text(
                  "Track Location",
                  style: TextStyle(fontSize: 40),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              locate.trackererror,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              val,
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
