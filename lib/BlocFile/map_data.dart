import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:epaisademo/Model/coordinates.dart';

Set<Marker> _markers = Set<Marker>();
final Set<Polyline> polyline = {};
List<LatLng> routeCoordinates;
Coordinates _coordinates = Coordinates();
GoogleMapPolyline googleMapPolyline =
    new GoogleMapPolyline(apiKey: "AIzaSyCQmxaKrBc0StNtLiBFp5VkYCSw55onV3k");

abstract class MapData {
  Future<Coordinates> getLocation();
  Set<Marker> setMarkers();
}

class Map implements MapData {

  Set<Marker> setMarkers() {
    print("Marker set on map");
    _markers.add(Marker(
        markerId: MarkerId("CurrentLocation"),
        position: LatLng(_coordinates.lat, _coordinates.lng),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Current Location")));

    _markers.add(Marker(
        markerId: MarkerId("DestinationLocation"),
        position: LatLng(19.112835, 72.860938),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Destination Location")));

    return _markers;
    //Random Destination Marker
  }

//  getsomePoints() async {
//    routeCoordinates = await googleMapPolyline.getCoordinatesWithLocation(
//        origin: LatLng(lat, lng),
//        destination: LatLng(19.112835, 72.860938),
//        mode: RouteMode.driving);
//  }

  Future<Coordinates> getLocation() async {
    final location = new Location();
    var currentLocation = await location.getLocation();

    _coordinates.lat = currentLocation.latitude;
    _coordinates.lng = currentLocation.longitude;
    print("the current location is ${_coordinates.lat} and ${_coordinates.lng}");
    return _coordinates;
  }

//  setPolylines() async {
//    polyline.add(Polyline(
//        polylineId: PolylineId('route1'),
//        visible: true,
//        points: routeCoordinates,
//        width: 10,
//        color: Colors.blue,
//        startCap: Cap.roundCap,
//        endCap: Cap.buttCap));
//  }
}
