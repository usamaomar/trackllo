// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as lats;
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import '/flutter_flow/lat_lng.dart' as tras;

class MapCustomWidget extends StatefulWidget {
  const MapCustomWidget({
    Key? key,
    this.width,
    this.height,
    required this.locationRequstedAction,
    required this.startTrip,
    required this.stopTrip,
    required this.travilLise,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() locationRequstedAction;
  final Future<dynamic> Function() startTrip;
  final Future<dynamic> Function() stopTrip;
  final Future<dynamic> Function() travilLise;

  @override
  _MapCustomWidgetState createState() => _MapCustomWidgetState();
}

class _MapCustomWidgetState extends State<MapCustomWidget> {
  late GoogleMapController mapController;
  bool isLocationEnabled = false;
  late StreamSubscription<Position> positionStream;

  late Position position = Position(
      longitude: 35.857670,
      latitude: 31.959345,
      timestamp: DateTime.now(),
      altitudeAccuracy: 100,
      accuracy: 100,
      altitude: 0,
      heading: 0,
      headingAccuracy: 100,
      speed: 100,
      speedAccuracy: 100);

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  late LocationSettings locationSettings;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _determinePosition();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
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
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List? imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData!);
  }

  void addCustomIcon() async {
    await getBitmapDescriptorFromAssetBytes("assets/images/bus_5.png", 100)
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  void getLocationApi() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 1,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 0),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Bus Location Is collected",
            notificationTitle: "Trackllo",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.best,
        activityType: ActivityType.fitness,
        distanceFilter: 1,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 1,
      );
    }

    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      setState(() {
        this.position = position ??
            Position(
                longitude: 35.857670,
                latitude: 31.959345,
                timestamp: DateTime.now(),
                accuracy: 100,
                altitudeAccuracy: 1,
                altitude: 0,
                heading: 0,
                headingAccuracy: 100,
                speed: 100,
                speedAccuracy: 100);
        mapController.moveCamera(CameraUpdate.newLatLng(lats.LatLng(
            position?.latitude ?? 0.0, position?.longitude ?? 0.0)));
        FFAppState().locationAppState = LocationModelStruct(
            lat: position?.latitude ?? 0.0, lng: position?.longitude ?? 0.0);
        widget.locationRequstedAction.call();
      });
    });
  }

  void clickAction() {
    getLocationApi();
    addCustomIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            position: lats.LatLng(position.latitude, position.longitude),
            draggable: false,
            icon: markerIcon,
          ),
        },
        initialCameraPosition: CameraPosition(
          target: lats.LatLng(position.latitude, position.longitude),
          zoom: 14.4746,
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: const BoxDecoration(
                        color: Color(0xffffffff),
                        shape: BoxShape.circle,
                      ),
                      child: const InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Icon(
                          Icons.reorder_sharp,
                          color: Colors.transparent,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: isLocationEnabled
                            ? FlutterFlowTheme.of(context).error
                            : FlutterFlowTheme.of(context).alternate,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Icon(
                          Icons.power_settings_new,
                          color: isLocationEnabled
                              ? FlutterFlowTheme.of(context).info
                              : FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onTap: () {
                          if (FFAppState().travilLine != null) {
                            if (!isLocationEnabled) {
                              clickAction();
                              positionStream.resume();
                              isLocationEnabled = true;
                              widget.startTrip.call();
                            } else {
                              positionStream.cancel();
                              isLocationEnabled = false;
                              widget.stopTrip.call();
                            }
                            setState(() {});
                          } else {
                            widget.travilLise.call();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ]));
  }
}
