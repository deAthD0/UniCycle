import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Import BikeInfo Screen
import 'BikeInfo.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  State<GoogleMapScreen> createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.9719, 79.1594),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set<Marker>.of(<Marker>[
          Marker(
              markerId: MarkerId('1'),
              position: LatLng(12.9717, 79.1594),
              infoWindow: InfoWindow(title: "Cycle", snippet: "Available"),
              icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
              flat: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BikeInfo();
                }));
              }),
          Marker(
              markerId: MarkerId('2'),
              position: LatLng(12.9718, 79.1594),
              infoWindow: InfoWindow(title: "Cycle", snippet: "Available"),
              icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
              flat: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BikeInfo();
                }));
              }),
          Marker(
              markerId: MarkerId('3'),
              position: LatLng(12.9719, 79.1594),
              infoWindow: InfoWindow(title: "Cycle", snippet: "Available"),
              icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BikeInfo();
                }));
              }),
          Marker(
              markerId: MarkerId('4'),
              position: LatLng(12.9716, 79.1595),
              infoWindow: InfoWindow(title: "Cycle", snippet: "Available"),
              icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
              flat: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BikeInfo();
                }));
              }),
          Marker(
              markerId: MarkerId('5'),
              position: LatLng(12.9713, 79.1596),
              infoWindow: InfoWindow(title: "Cycle", snippet: "Available"),
              icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
              flat: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BikeInfo();
                }));
              }),
          Marker(
              markerId: MarkerId('6'),
              position: LatLng(12.9719, 79.1597),
              infoWindow: InfoWindow(title: "Cycle", snippet: "Available"),
              icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
              flat: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BikeInfo();
                }));
              })
        ]),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
