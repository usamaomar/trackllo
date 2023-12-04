import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  UserModelStruct _UserModelAppState = UserModelStruct();
  UserModelStruct get UserModelAppState => _UserModelAppState;
  set UserModelAppState(UserModelStruct value) {
    _UserModelAppState = value;
  }

  void updateUserModelAppStateStruct(Function(UserModelStruct) updateFn) {
    updateFn(_UserModelAppState);
  }

  String _currentLanguge = '';
  String get currentLanguge => _currentLanguge;
  set currentLanguge(String value) {
    _currentLanguge = value;
  }

  LocationModelStruct _locationAppState = LocationModelStruct();
  LocationModelStruct get locationAppState => _locationAppState;
  set locationAppState(LocationModelStruct value) {
    _locationAppState = value;
  }

  void updateLocationAppStateStruct(Function(LocationModelStruct) updateFn) {
    updateFn(_locationAppState);
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
