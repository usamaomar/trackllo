// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationModelStruct extends BaseStruct {
  LocationModelStruct({
    double? lat,
    double? lng,
  })  : _lat = lat,
        _lng = lng;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;
  void incrementLat(double amount) => _lat = lat + amount;
  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;
  void incrementLng(double amount) => _lng = lng + amount;
  bool hasLng() => _lng != null;

  static LocationModelStruct fromMap(Map<String, dynamic> data) =>
      LocationModelStruct(
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
      );

  static LocationModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LocationModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lng': _lng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
      }.withoutNulls;

  static LocationModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationModelStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LocationModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationModelStruct && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lng]);
}

LocationModelStruct createLocationModelStruct({
  double? lat,
  double? lng,
}) =>
    LocationModelStruct(
      lat: lat,
      lng: lng,
    );
