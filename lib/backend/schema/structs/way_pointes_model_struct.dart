// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WayPointesModelStruct extends BaseStruct {
  WayPointesModelStruct({
    String? id,
    double? lng,
    String? label,
    double? lat,
  })  : _id = id,
        _lng = lng,
        _label = label,
        _lat = lat;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;
  void incrementLng(double amount) => _lng = lng + amount;
  bool hasLng() => _lng != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;
  void incrementLat(double amount) => _lat = lat + amount;
  bool hasLat() => _lat != null;

  static WayPointesModelStruct fromMap(Map<String, dynamic> data) =>
      WayPointesModelStruct(
        id: data['id'] as String?,
        lng: castToType<double>(data['lng']),
        label: data['label'] as String?,
        lat: castToType<double>(data['lat']),
      );

  static WayPointesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? WayPointesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'lng': _lng,
        'label': _label,
        'lat': _lat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
      }.withoutNulls;

  static WayPointesModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      WayPointesModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WayPointesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WayPointesModelStruct &&
        id == other.id &&
        lng == other.lng &&
        label == other.label &&
        lat == other.lat;
  }

  @override
  int get hashCode => const ListEquality().hash([id, lng, label, lat]);
}

WayPointesModelStruct createWayPointesModelStruct({
  String? id,
  double? lng,
  String? label,
  double? lat,
}) =>
    WayPointesModelStruct(
      id: id,
      lng: lng,
      label: label,
      lat: lat,
    );
