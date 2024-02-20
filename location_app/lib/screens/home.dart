import "package:flutter/material.dart";
import "package:location_app/services/determinepositon.dart";
import "package:provider/provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isvisible = false;

  @override
  Widget build(BuildContext context) {
    final LocationTracker locationTracker =
        Provider.of<LocationTracker>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Location Tracker App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your location is: ${locationTracker.currposition}"),
            TextButton(
                onPressed: () async {
                  await locationTracker.determinePosition();
                  setState(() {
                    if (locationTracker.currposition != "Unknown") {
                      _isvisible = true;
                    } else {
                      _isvisible = false;
                    }
                  });
                },
                child: const Text("Get Location")),
            Text(locationTracker.trackererror),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: _isvisible,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/actualmap");
                  },
                  child: const Text("Show on Map"),
                )),
          ],
        ),
      ),
    );
  }
}
