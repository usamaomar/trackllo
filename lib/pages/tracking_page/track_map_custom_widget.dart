// Automatic FlutterFlow imports
import 'dart:math';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

class TrackMapCustomWidget extends StatefulWidget {
  const TrackMapCustomWidget({
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

class _MapCustomWidgetState extends State<TrackMapCustomWidget> {
  late GoogleMapController mapController;
  bool isLocationEnabled = false;
  bool isTrackToBeginEnabled = false;
  late StreamSubscription<Position> positionStream;
  late Set<Marker> markers;

  late Position position = Position(
      longitude: 35.857670,
      latitude: 31.959345,
      timestamp: DateTime.now(),
      accuracy: 100,
      altitude: 0,
      heading: 0,
      speed: 100,
      speedAccuracy: 100);

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  late LocationSettings locationSettings;

  @override
  void initState() {
    super.initState();
    markers = <Marker>{};
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

  Future checkPermition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('تم تعطيل تحديد خدمات الموقع.');
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
        return Future.error('تم رفض تحديد الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'تم رفض تحديد الموقع بشكل دائم، ولا يمكننا طلب اذن.');
    }

    return Future.error('');
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    const earthRadius = 6371.0; // Radius of the Earth in kilometers

    // Convert degrees to radians
    double toRadians(double degree) {
      return degree * pi / 180.0;
    }

    // Haversine formula
    num haversine(double theta) {
      return pow(sin(theta / 2), 2);
    }

    double deltaLat = toRadians(lat2 - lat1);
    double deltaLng = toRadians(lng2 - lng1);

    double a = haversine(deltaLat) +
        cos(toRadians(lat1)) * cos(toRadians(lat2)) * haversine(deltaLng);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate the distance
    double distance = earthRadius * c;

    return distance;
  }

  bool isWithinRadius(
      double myLat, double myLng, double lat, double lng, double radius) {
    double distance = calculateDistance(myLat, myLng, lat, lng);

    return distance <= radius;
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
        dynamic line = FFAppState().travilLine;
        for (var setting in line['way_points']) {
          markers.add(Marker(
            markerId: MarkerId(setting['label']),
            position: lats.LatLng(
                setting['lat'].toDouble(), setting['lng'].toDouble()),
            draggable: false,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ));
        }
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
                // altitudeAccuracy: 1,
                altitude: 0,
                heading: 0,
                // headingAccuracy: 100,
                speed: 100,
                speedAccuracy: 100);
        mapController.moveCamera(CameraUpdate.newLatLng(lats.LatLng(
            position?.latitude ?? 0.0, position?.longitude ?? 0.0)));
        FFAppState().locationAppState = LocationModelStruct(
            lat: position?.latitude ?? 0.0, lng: position?.longitude ?? 0.0);
        LocationModelStruct loc = FFAppState().locationAppState;
        markers.add(Marker(
          markerId: const MarkerId("marker1"),
          position: lats.LatLng(loc.lat, loc.lng),
          draggable: false,
          icon: markerIcon,
        ));
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
        markers: markers,
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
                        onTap: () async {
                          checkPermition().catchError((onError) {
                            if(onError.toString().isEmpty){
                              if (FFAppState().travilLine != null) {
                                trackLocation();
                              } else {
                                widget.travilLise.call();
                              }
                            }else{
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: onError,
                                      arText: onError,
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(
                                          context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration:
                                  Duration(milliseconds: 4000),
                                  backgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondary,
                                ),
                              );
                            }
                          });
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

  void trackLocation() async {
    if (!isLocationEnabled) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text(FFLocalizations.of(context).getVariableText(
              enText: 'Alert',
              arText: 'تنبيه',
            )),
            content: Text(FFLocalizations.of(context).getVariableText(
              enText: 'Are you sure you want to start the traking',
              arText: 'هل انت متأكد من بدء التتبع',
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(alertDialogContext);
                  clickAction();
                  positionStream.resume();
                  isLocationEnabled = true;
                  widget.startTrip.call();
                },
                child: Text(FFLocalizations.of(context).getVariableText(
                  enText: 'Ok',
                  arText: 'حسنا',
                )),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(alertDialogContext);
                },
                child: Text(
                  FFLocalizations.of(context).getVariableText(
                    enText: 'Cancel',
                    arText: 'الغاء',
                  ),
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
    } else {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text(FFLocalizations.of(context).getVariableText(
              enText: 'Alert',
              arText: 'تنبيه',
            )),
            content: RichText(
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: FFLocalizations.of(context).getVariableText(
                    enText: 'Are you sure you want to ',
                    arText: 'هل انت متأكد من ',
                  )),
                  TextSpan(
                      text: FFLocalizations.of(context).getVariableText(
                        enText: 'Stop',
                        arText: 'ايقاف',
                      ),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: FFLocalizations.of(context).getVariableText(
                    enText: ' the traking',
                    arText: ' التتبع',
                  )),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(alertDialogContext);
                  positionStream.cancel();
                  isLocationEnabled = false;
                  widget.stopTrip.call();
                },
                child: Text(FFLocalizations.of(context).getVariableText(
                  enText: 'Ok',
                  arText: 'حسنا',
                )),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(alertDialogContext);
                },
                child: Text(
                  FFLocalizations.of(context).getVariableText(
                    enText: 'Cancel',
                    arText: 'الغاء',
                  ),
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }
}
