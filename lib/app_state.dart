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
      _appStateOfflineModel = prefs
              .getStringList('ff_appStateOfflineModel')
              ?.map((x) {
                try {
                  return OfflineModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _appStateOfflineModel;
    });
    _safeInit(() {
      _numberOfStudents =
          prefs.getInt('ff_numberOfStudents') ?? _numberOfStudents;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_assighnedModel')) {
        try {
          final serializedData = prefs.getString('ff_assighnedModel') ?? '{}';
          _assighnedModel = AsighnedMeModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isliveLocationEnabled =
          prefs.getBool('ff_isliveLocationEnabled') ?? _isliveLocationEnabled;
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

  List<OfflineModelStruct> _appStateOfflineModel = [];
  List<OfflineModelStruct> get appStateOfflineModel => _appStateOfflineModel;
  set appStateOfflineModel(List<OfflineModelStruct> _value) {
    _appStateOfflineModel = _value;
    prefs.setStringList(
        'ff_appStateOfflineModel', _value.map((x) => x.serialize()).toList());
  }

  void addToAppStateOfflineModel(OfflineModelStruct _value) {
    _appStateOfflineModel.add(_value);
    prefs.setStringList('ff_appStateOfflineModel',
        _appStateOfflineModel.map((x) => x.serialize()).toList());
  }

  void removeFromAppStateOfflineModel(OfflineModelStruct _value) {
    _appStateOfflineModel.remove(_value);
    prefs.setStringList('ff_appStateOfflineModel',
        _appStateOfflineModel.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAppStateOfflineModel(int _index) {
    _appStateOfflineModel.removeAt(_index);
    prefs.setStringList('ff_appStateOfflineModel',
        _appStateOfflineModel.map((x) => x.serialize()).toList());
  }

  void updateAppStateOfflineModelAtIndex(
    int _index,
    OfflineModelStruct Function(OfflineModelStruct) updateFn,
  ) {
    _appStateOfflineModel[_index] = updateFn(_appStateOfflineModel[_index]);
    prefs.setStringList('ff_appStateOfflineModel',
        _appStateOfflineModel.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAppStateOfflineModel(
      int _index, OfflineModelStruct _value) {
    _appStateOfflineModel.insert(_index, _value);
    prefs.setStringList('ff_appStateOfflineModel',
        _appStateOfflineModel.map((x) => x.serialize()).toList());
  }

  int _numberOfStudents = 0;
  int get numberOfStudents => _numberOfStudents;
  set numberOfStudents(int _value) {
    _numberOfStudents = _value;
    prefs.setInt('ff_numberOfStudents', _value);
  }

  AsighnedMeModelStruct _assighnedModel = AsighnedMeModelStruct();
  AsighnedMeModelStruct get assighnedModel => _assighnedModel;
  set assighnedModel(AsighnedMeModelStruct _value) {
    _assighnedModel = _value;
    prefs.setString('ff_assighnedModel', _value.serialize());
  }

  void updateAssighnedModelStruct(Function(AsighnedMeModelStruct) updateFn) {
    updateFn(_assighnedModel);
    prefs.setString('ff_assighnedModel', _assighnedModel.serialize());
  }

  bool _isliveLocationEnabled = false;
  bool get isliveLocationEnabled => _isliveLocationEnabled;
  set isliveLocationEnabled(bool _value) {
    _isliveLocationEnabled = _value;
    prefs.setBool('ff_isliveLocationEnabled', _value);
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
