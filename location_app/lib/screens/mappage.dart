import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";
import "package:location_app/services/determinepositon.dart";
import "package:provider/provider.dart";
import "package:url_launcher/url_launcher.dart";

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final locationTracker = Provider.of<LocationTracker>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Map Page")),
        body: FlutterMap(
            options: MapOptions(
                initialCenter: LatLng(locationTracker.currlatitude,
                    locationTracker.currlongitude)),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => launchUrl(
                        Uri.parse('https://openstreetmap.org/copyright')),
                  ),
                ],
              ),
              MarkerLayer(markers: [
                Marker(
                    point: LatLng(locationTracker.currlatitude,
                        locationTracker.currlongitude),
                    rotate: true,
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red[700],
                      size: 40,
                    ))
              ])
            ]));
  }
}
