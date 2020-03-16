import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:epaisademo/Model/coordinates.dart';
import 'package:epaisademo/BlocFile/map_data.dart';

//1. get user location data.
//2. show circular progress bar id data is not yet received.
//3. show map after data received.
//4.set markers for current location.
//5.set markers for destination location ------ calculate random lat lng in 1000 mts distance.
//6.set route or poly lines.

var loading = true;

class MapPage extends StatefulWidget {
  final MapData _mapData = new Map();

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Coordinates _coordinates = Coordinates();
  Set<Marker> _marker;

  @override
  void initState() {
    super.initState();
    loading = true;
    getLocationFromBloc();
  }

  //Get user location data from bloc
  Future<void> getLocationFromBloc() async {
    _coordinates = await widget._mapData.getLocation();
    if (_coordinates != null) {
      setState(() {
        loading = false;
      });
    } else {
      print("cordinates are loading.....something went wrong");
    }
  }

  //get marker data from Bloc
  setMarkersFromBloc() {
    setState(() {
      _marker = widget._mapData.setMarkers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: loading == true
            ? CircularProgressIndicator()
            : GoogleMap(
                mapType: MapType.normal,
                markers: _marker,
                polylines: polyline,
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                      _coordinates.lat,
                      _coordinates.lng,
                    ),
                    zoom: 15.0),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  //set Markers after completion
                  setMarkersFromBloc();
                },
              ),
      ),
    );
  }
}
