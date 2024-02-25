import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationTracker extends ChangeNotifier {
  Position? _currposition;
  String _error = "";

  String? get currposition {
    if (_currposition == null) return "Unknown";
    return _currposition.toString();
  }

  double get currlatitude {
    if (_currposition == null) return 0;
    return _currposition!.latitude;
  }

  double get currlongitude {
    if (_currposition == null) return 0;
    return _currposition!.longitude;
  }

  String get trackererror {
    return _error;
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      _error = 'Location services are disabled.';
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _error = 'Location permissions are denied';
        notifyListeners();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      _error =
          'Location permissions are permanently denied, we cannot request permissions.';
      notifyListeners();
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _currposition = await Geolocator.getCurrentPosition();
    _error = "";
    notifyListeners();
  }
}
