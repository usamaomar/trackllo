import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<BusServicesModelStruct> fromJsonToListRecords(dynamic jsonBody) {
  return jsonBody
      .map((e) =>
          e != null && e != '' ? BusServicesModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<BusServicesModelStruct>();
}

String dateFromat() {
  return DateFormat('yyyy-MM-dd', 'en').format(DateTime.timestamp());
}

dynamic findBusByUserId(
  List<dynamic> busArray,
  String userId,
) {
  for (var bus in busArray) {
    List<String> drivers = List<String>.from(bus['drivers']);
    if (drivers.contains(userId)) {
      // If the userId is found in the drivers list, return the bus object
      return bus;
    }
  }
  // If no match is found, return null or handle accordingly
  return null;
}

String convertFromImagePathToString(FFUploadedFile imageFile) {
  return "imgBase64";
}

LocationModelStruct convertLocation(LatLng location) {
  return LocationModelStruct(lat: location.latitude, lng: location.longitude);
}
