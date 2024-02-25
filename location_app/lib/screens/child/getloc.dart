import 'package:flutter/material.dart';
import "package:location_app/services/auth.dart";
import "package:location_app/services/determinepositon.dart";
import "package:provider/provider.dart";

class Getlocation extends StatefulWidget {
  const Getlocation({super.key});

  @override
  State<Getlocation> createState() => _GetlocationState();
}

class _GetlocationState extends State<Getlocation> {
  bool isvisible = false;
  final auth = Authenticate();
  @override
  Widget build(BuildContext context) {
    final LocationTracker locationTracker =
        Provider.of<LocationTracker>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Tracker App"),
        actions: [
          TextButton.icon(
              onPressed: () async {
                try {
                  await auth.signout();
                } catch (e) {
                  // print(e);
                }
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your location is: \n ${locationTracker.currposition}",
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () async {
                  await locationTracker.determinePosition();
                  setState(() {
                    if (locationTracker.currposition != "Unknown") {
                      isvisible = true;
                    } else {
                      isvisible = false;
                    }
                  });
                },
                child: const Text("Get Location")),
            Text(locationTracker.trackererror),
            const SizedBox(
              height: 100,
            ),
            Visibility(
                visible: isvisible,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/actualmap");
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue[600])),
                  child: const Text(
                    "Show on Map",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
