// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfflineModelStruct extends BaseStruct {
  OfflineModelStruct({
    String? token,
    String? busNumber,
    String? lat,
    String? lng,
    String? userName,
    String? user,
    String? time,
    String? university,
    String? bus,
    String? busIdentity,
  })  : _token = token,
        _busNumber = busNumber,
        _lat = lat,
        _lng = lng,
        _userName = userName,
        _user = user,
        _time = time,
        _university = university,
        _bus = bus,
        _busIdentity = busIdentity;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "busNumber" field.
  String? _busNumber;
  String get busNumber => _busNumber ?? '';
  set busNumber(String? val) => _busNumber = val;
  bool hasBusNumber() => _busNumber != null;

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;
  bool hasLat() => _lat != null;

  // "lng" field.
  String? _lng;
  String get lng => _lng ?? '';
  set lng(String? val) => _lng = val;
  bool hasLng() => _lng != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  set user(String? val) => _user = val;
  bool hasUser() => _user != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  set university(String? val) => _university = val;
  bool hasUniversity() => _university != null;

  // "bus" field.
  String? _bus;
  String get bus => _bus ?? '';
  set bus(String? val) => _bus = val;
  bool hasBus() => _bus != null;

  // "busIdentity" field.
  String? _busIdentity;
  String get busIdentity => _busIdentity ?? '';
  set busIdentity(String? val) => _busIdentity = val;
  bool hasBusIdentity() => _busIdentity != null;

  static OfflineModelStruct fromMap(Map<String, dynamic> data) =>
      OfflineModelStruct(
        token: data['token'] as String?,
        busNumber: data['busNumber'] as String?,
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
        userName: data['userName'] as String?,
        user: data['user'] as String?,
        time: data['time'] as String?,
        university: data['university'] as String?,
        bus: data['bus'] as String?,
        busIdentity: data['busIdentity'] as String?,
      );

  static OfflineModelStruct? maybeFromMap(dynamic data) => data is Map
      ? OfflineModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
        'busNumber': _busNumber,
        'lat': _lat,
        'lng': _lng,
        'userName': _userName,
        'user': _user,
        'time': _time,
        'university': _university,
        'bus': _bus,
        'busIdentity': _busIdentity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'busNumber': serializeParam(
          _busNumber,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.String,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'university': serializeParam(
          _university,
          ParamType.String,
        ),
        'bus': serializeParam(
          _bus,
          ParamType.String,
        ),
        'busIdentity': serializeParam(
          _busIdentity,
          ParamType.String,
        ),
      }.withoutNulls;

  static OfflineModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      OfflineModelStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        busNumber: deserializeParam(
          data['busNumber'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        university: deserializeParam(
          data['university'],
          ParamType.String,
          false,
        ),
        bus: deserializeParam(
          data['bus'],
          ParamType.String,
          false,
        ),
        busIdentity: deserializeParam(
          data['busIdentity'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OfflineModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OfflineModelStruct &&
        token == other.token &&
        busNumber == other.busNumber &&
        lat == other.lat &&
        lng == other.lng &&
        userName == other.userName &&
        user == other.user &&
        time == other.time &&
        university == other.university &&
        bus == other.bus &&
        busIdentity == other.busIdentity;
  }

  @override
  int get hashCode => const ListEquality().hash([
        token,
        busNumber,
        lat,
        lng,
        userName,
        user,
        time,
        university,
        bus,
        busIdentity
      ]);
}

OfflineModelStruct createOfflineModelStruct({
  String? token,
  String? busNumber,
  String? lat,
  String? lng,
  String? userName,
  String? user,
  String? time,
  String? university,
  String? bus,
  String? busIdentity,
}) =>
    OfflineModelStruct(
      token: token,
      busNumber: busNumber,
      lat: lat,
      lng: lng,
      userName: userName,
      user: user,
      time: time,
      university: university,
      bus: bus,
      busIdentity: busIdentity,
    );
