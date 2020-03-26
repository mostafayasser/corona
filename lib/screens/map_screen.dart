import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//AIzaSyAYsl5mcNYX_aulajNTMZgAnz0cnxR_4r0

class MapScreen extends StatefulWidget {
  static const route = "/mapScreen";
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  GoogleMapController _controller;
  bool infict = false;
  int counter = 0;
  final green =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  final red = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  final yellow =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);

  static LatLng mark_1 = LatLng(40.744435, -74.190299);
  static LatLng mark_2 = LatLng(40.742680, -74.191243);
  static LatLng mark_3 = LatLng(40.741590, -74.191823);
  static LatLng mark_4 = LatLng(40.742582, -74.191265);
  static LatLng mark_5 = LatLng(40.744727, -74.190167);
  static LatLng mark_6 = LatLng(40.745896, -74.189644);
  @override
  Widget build(BuildContext context) {
    List<Marker> allMarkers = [
      Marker(
          markerId: MarkerId('1'),
          icon: infict ? yellow : green,
          draggable: true,
          onTap: () {
            print('Marker Tapped');
          },
          position: mark_1),
      Marker(
          markerId: MarkerId('2'),
          icon: infict ? yellow : green,
          draggable: true,
          onTap: () {
            print('Marker Tapped');
          },
          position: mark_2),
      Marker(
        //infoWindow: InfoWindow(),
          markerId: MarkerId('3'),
          icon: infict ? red : green,
          draggable: true,
          onTap: () {
            print('Marker Tapped');
          },
          position: mark_3)
    ];
    return SafeArea(
        child: Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(40.744435, -74.190299), zoom: 12.0),
        markers: Set.from(allMarkers),
        onMapCreated: mapCreated,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            onPressed: _reset,
            child: Text('Reset'),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: _infect,
            child: Text('Infect'),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: _move,
            child: Text('Move'),
          ),
        ],
      ),
    ));
  }

  void _move() async {
    print(counter);
    counter++;
    if (counter == 1) {
      setState(() {
        mark_3 = mark_4;
      });
    } else if (counter == 2) {
      setState(() {
        mark_3 = mark_5;
      });
    } else if (counter == 3) {
      setState(() {
        mark_3 = mark_6;
      });
    }
  }

  void _reset() async {
    setState(() {
      infict = false;
      counter = 0;
      mark_3 = LatLng(40.741590, -74.191823);
    });
  }

  void _infect() async {
    setState(() {
      infict = true;
    });
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
}
