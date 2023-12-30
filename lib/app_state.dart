import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserModelAppState')) {
        try {
          final serializedData =
              prefs.getString('ff_UserModelAppState') ?? '{}';
          _UserModelAppState =
              UserModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _currentLanguge = prefs.getString('ff_currentLanguge') ?? _currentLanguge;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_locationAppState')) {
        try {
          final serializedData = prefs.getString('ff_locationAppState') ?? '{}';
          _locationAppState = LocationModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_travilLine')) {
        try {
          _travilLine = jsonDecode(prefs.getString('ff_travilLine') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _UseTrackToBiginApiAppState =
          prefs.getBool('ff_UseTrackToBiginApiAppState') ??
              _UseTrackToBiginApiAppState;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_houseLocation')) {
        try {
          final serializedData = prefs.getString('ff_houseLocation') ?? '{}';
          _houseLocation = LocationModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _tripIdToBeCanceld =
          prefs.getString('ff_tripIdToBeCanceld') ?? _tripIdToBeCanceld;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_travilLineAppState')) {
        try {
          _travilLineAppState =
              jsonDecode(prefs.getString('ff_travilLineAppState') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserModelStruct _UserModelAppState = UserModelStruct();
  UserModelStruct get UserModelAppState => _UserModelAppState;
  set UserModelAppState(UserModelStruct _value) {
    _UserModelAppState = _value;
    prefs.setString('ff_UserModelAppState', _value.serialize());
  }

  void updateUserModelAppStateStruct(Function(UserModelStruct) updateFn) {
    updateFn(_UserModelAppState);
    prefs.setString('ff_UserModelAppState', _UserModelAppState.serialize());
  }

  String _currentLanguge = '';
  String get currentLanguge => _currentLanguge;
  set currentLanguge(String _value) {
    _currentLanguge = _value;
    prefs.setString('ff_currentLanguge', _value);
  }

  LocationModelStruct _locationAppState = LocationModelStruct();
  LocationModelStruct get locationAppState => _locationAppState;
  set locationAppState(LocationModelStruct _value) {
    _locationAppState = _value;
    prefs.setString('ff_locationAppState', _value.serialize());
  }

  void updateLocationAppStateStruct(Function(LocationModelStruct) updateFn) {
    updateFn(_locationAppState);
    prefs.setString('ff_locationAppState', _locationAppState.serialize());
  }

  dynamic _travilLine;
  dynamic get travilLine => _travilLine;
  set travilLine(dynamic _value) {
    _travilLine = _value;
    prefs.setString('ff_travilLine', jsonEncode(_value));
  }

  bool _UseTrackToBiginApiAppState = false;
  bool get UseTrackToBiginApiAppState => _UseTrackToBiginApiAppState;
  set UseTrackToBiginApiAppState(bool _value) {
    _UseTrackToBiginApiAppState = _value;
    prefs.setBool('ff_UseTrackToBiginApiAppState', _value);
  }

  LocationModelStruct _houseLocation = LocationModelStruct.fromSerializableMap(
      jsonDecode('{\"lat\":\"0\",\"lng\":\"0\"}'));
  LocationModelStruct get houseLocation => _houseLocation;
  set houseLocation(LocationModelStruct _value) {
    _houseLocation = _value;
    prefs.setString('ff_houseLocation', _value.serialize());
  }

  void updateHouseLocationStruct(Function(LocationModelStruct) updateFn) {
    updateFn(_houseLocation);
    prefs.setString('ff_houseLocation', _houseLocation.serialize());
  }

  String _tripIdToBeCanceld = '';
  String get tripIdToBeCanceld => _tripIdToBeCanceld;
  set tripIdToBeCanceld(String _value) {
    _tripIdToBeCanceld = _value;
    prefs.setString('ff_tripIdToBeCanceld', _value);
  }

  dynamic _travilLineAppState;
  dynamic get travilLineAppState => _travilLineAppState;
  set travilLineAppState(dynamic _value) {
    _travilLineAppState = _value;
    prefs.setString('ff_travilLineAppState', jsonEncode(_value));
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
