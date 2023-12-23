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

String convertJsonToString(String input) {
  if (!input.startsWith("{")) {
    return input;
  }
  dynamic json = jsonDecode(input);
  try {
    // Reverse the input string
    // String reversedString = input.split('').reversed.join();

    // Parse the reversed string into a JSON object

    if (json is Map) {
      // If the reversed string is a JSON object, iterate through its entries
      List<String> lines = [];
      json.forEach((key, value) {
        if (value is List) {
          // If the value is a list, convert it to a comma-separated string
          lines.add('${value.join(', ')}');
        } else if (value is Map) {
          // If the value is another object, recursively convert it
          lines.add('${convertJsonToStringInternal(value)}');
        } else {
          // Otherwise, append the key-value pair as a string
          lines.add('$value');
        }
      });
      // Join the lines with line breaks and return the result
      return lines.join('\n');
    } else {
      // If the reversed string is not a JSON object, return it as is
      return input;
    }
  } catch (e) {
    // If an exception occurs during parsing, return the reversed string as is
    return input;
  }
}

String convertJsonToStringInternal(dynamic json) {
  try {
    // Reverse the input string
    // String reversedString = input.split('').reversed.join();

    // Parse the reversed string into a JSON object

    if (json is Map) {
      // If the reversed string is a JSON object, iterate through its entries
      List<String> lines = [];
      json.forEach((key, value) {
        if (value is List) {
          // If the value is a list, convert it to a comma-separated string
          lines.add('${value.join(', ')}');
        } else if (value is Map) {
          // If the value is another object, recursively convert it
          lines.add('${convertJsonToStringInternal(value)}');
        } else {
          // Otherwise, append the key-value pair as a string
          lines.add('$value');
        }
      });
      // Join the lines with line breaks and return the result
      return lines.join('\n');
    } else {
      // If the reversed string is not a JSON object, return it as is
      return json.toString();
    }
  } catch (e) {
    // If an exception occurs during parsing, return the reversed string as is
    return json.toString();
  }
}
