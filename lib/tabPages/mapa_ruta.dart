import 'dart:async';

import 'package:cleanning_alert_neighbor/infoHandler/app_info.dart';
import 'package:cleanning_alert_neighbor/routes/points/linea17.dart';
import 'package:cleanning_alert_neighbor/tabPages/ubicacion_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../assistants/assistants_methods.dart';
import '../assistants/geofire_assistant.dart';
import '../models/active_nearby_available_drivers.dart';
import '../routes/polylines/linea17.dart';

class MapaRutaTabPage extends StatefulWidget {
  MapaRutaTabPage({Key? key}) : super(key: key);

  @override
  State<MapaRutaTabPage> createState() => _MapaRutaTabPageState();
}

class _MapaRutaTabPageState extends State<MapaRutaTabPage> {
  GoogleMapController? newGoogleMapController;
  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-17.7833, -63.1821),
    zoom: 200,
  );

  Position? userCurrentPosition;
  var geoLocator = Geolocator();

  LocationPermission? _locationPermission;
  bool activeNearbyDriversKeysLoaded = false;
  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};
  BitmapDescriptor? activeNearbyIcon;
  List<ActiveNearbyAvailableDrivers> onlineNearByAvailableDriversList = [];

//// Polilines
  List<Polyline> myPolyline = [];

  ///

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  locateUserPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng LatLngPosition =
        LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: LatLngPosition, zoom: 14);
    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    if (mounted) {
      String humanReadableAddress =
          await AssistantMethods.searchAddressForGeographicsCoordinates(
              userCurrentPosition!, context);

      print(humanReadableAddress);
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfLocationPermissionAllowed();
    createPloyline();
  }

  ///createPoliline
  createPloyline() {
    myPolyline.add(Polyline(
      polylineId: PolylineId('1'),
      color: Colors.blue,
      width: 3,
      points: linea17I,
    ));
  }
  //

  @override
  Widget build(BuildContext context) {
    // createActiveNearByDriverIconMaker();
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Color.fromARGB(255, 5, 125, 113),
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UbicacionTabPage()));
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_alert,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(
          children: [
            ChangeNotifierProvider(
              create: (context) => AppInfo(),
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                markers: markerSet,
                circles: circleSet,
                zoomControlsEnabled: true,
                initialCameraPosition: _kGooglePlex,
                polylines: myPolyline.toSet(),
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  newGoogleMapController = controller;
                  //locateUserPosition();
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: Color.fromARGB(255, 37, 210, 126),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              child: const Text("Regresar",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
