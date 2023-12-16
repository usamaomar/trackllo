import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserModelStruct _UserModelAppState = UserModelStruct();
  UserModelStruct get UserModelAppState => _UserModelAppState;
  set UserModelAppState(UserModelStruct value) {
    _UserModelAppState = value;
    prefs.setString('ff_UserModelAppState', value.serialize());
  }

  void updateUserModelAppStateStruct(Function(UserModelStruct) updateFn) {
    updateFn(_UserModelAppState);
    prefs.setString('ff_UserModelAppState', _UserModelAppState.serialize());
  }

  String _currentLanguge = '';
  String get currentLanguge => _currentLanguge;
  set currentLanguge(String value) {
    _currentLanguge = value;
    prefs.setString('ff_currentLanguge', value);
  }

  LocationModelStruct _locationAppState = LocationModelStruct();
  LocationModelStruct get locationAppState => _locationAppState;
  set locationAppState(LocationModelStruct value) {
    _locationAppState = value;
    prefs.setString('ff_locationAppState', value.serialize());
  }

  void updateLocationAppStateStruct(Function(LocationModelStruct) updateFn) {
    updateFn(_locationAppState);
    prefs.setString('ff_locationAppState', _locationAppState.serialize());
  }

  dynamic _travilLine;
  dynamic get travilLine => _travilLine;
  set travilLine(dynamic value) {
    _travilLine = value;
    prefs.setString('ff_travilLine', jsonEncode(value));
  }

  bool _UseTrackToBiginApiAppState = false;
  bool get UseTrackToBiginApiAppState => _UseTrackToBiginApiAppState;
  set UseTrackToBiginApiAppState(bool value) {
    _UseTrackToBiginApiAppState = value;
    prefs.setBool('ff_UseTrackToBiginApiAppState', value);
  }

  LocationModelStruct _houseLocation = LocationModelStruct.fromSerializableMap(
      jsonDecode('{"lat":"0","lng":"0"}'));
  LocationModelStruct get houseLocation => _houseLocation;
  set houseLocation(LocationModelStruct value) {
    _houseLocation = value;
    prefs.setString('ff_houseLocation', value.serialize());
  }

  void updateHouseLocationStruct(Function(LocationModelStruct) updateFn) {
    updateFn(_houseLocation);
    prefs.setString('ff_houseLocation', _houseLocation.serialize());
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
