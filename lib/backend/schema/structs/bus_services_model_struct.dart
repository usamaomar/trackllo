// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusServicesModelStruct extends BaseStruct {
  BusServicesModelStruct({
    String? busNumber,
    String? driverId,
    String? driverName,
    String? type,
    String? date,
    int? currentCounter,
    String? notes,
    String? oilType,
    String? university,
    bool? disabled,
    String? id,
    int? vv,
    int? price,
    int? addedLiters,
  })  : _busNumber = busNumber,
        _driverId = driverId,
        _driverName = driverName,
        _type = type,
        _date = date,
        _currentCounter = currentCounter,
        _notes = notes,
        _oilType = oilType,
        _university = university,
        _disabled = disabled,
        _id = id,
        _vv = vv,
        _price = price,
        _addedLiters = addedLiters;

  // "bus_number" field.
  String? _busNumber;
  String get busNumber => _busNumber ?? '';
  set busNumber(String? val) => _busNumber = val;
  bool hasBusNumber() => _busNumber != null;

  // "driver_id" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  set driverId(String? val) => _driverId = val;
  bool hasDriverId() => _driverId != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  set driverName(String? val) => _driverName = val;
  bool hasDriverName() => _driverName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "current_counter" field.
  int? _currentCounter;
  int get currentCounter => _currentCounter ?? 0;
  set currentCounter(int? val) => _currentCounter = val;
  void incrementCurrentCounter(int amount) =>
      _currentCounter = currentCounter + amount;
  bool hasCurrentCounter() => _currentCounter != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;
  bool hasNotes() => _notes != null;

  // "oil_type" field.
  String? _oilType;
  String get oilType => _oilType ?? '';
  set oilType(String? val) => _oilType = val;
  bool hasOilType() => _oilType != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  set university(String? val) => _university = val;
  bool hasUniversity() => _university != null;

  // "disabled" field.
  bool? _disabled;
  bool get disabled => _disabled ?? false;
  set disabled(bool? val) => _disabled = val;
  bool hasDisabled() => _disabled != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "vv" field.
  int? _vv;
  int get vv => _vv ?? 0;
  set vv(int? val) => _vv = val;
  void incrementVv(int amount) => _vv = vv + amount;
  bool hasVv() => _vv != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;
  void incrementPrice(int amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "added_liters" field.
  int? _addedLiters;
  int get addedLiters => _addedLiters ?? 0;
  set addedLiters(int? val) => _addedLiters = val;
  void incrementAddedLiters(int amount) => _addedLiters = addedLiters + amount;
  bool hasAddedLiters() => _addedLiters != null;

  static BusServicesModelStruct fromMap(Map<String, dynamic> data) =>
      BusServicesModelStruct(
        busNumber: data['bus_number'] as String?,
        driverId: data['driver_id'] as String?,
        driverName: data['driver_name'] as String?,
        type: data['type'] as String?,
        date: data['date'] as String?,
        currentCounter: castToType<int>(data['current_counter']),
        notes: data['notes'] as String?,
        oilType: data['oil_type'] as String?,
        university: data['university'] as String?,
        disabled: data['disabled'] as bool?,
        id: data['id'] as String?,
        vv: castToType<int>(data['vv']),
        price: castToType<int>(data['price']),
        addedLiters: castToType<int>(data['added_liters']),
      );

  static BusServicesModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? BusServicesModelStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'bus_number': _busNumber,
        'driver_id': _driverId,
        'driver_name': _driverName,
        'type': _type,
        'date': _date,
        'current_counter': _currentCounter,
        'notes': _notes,
        'oil_type': _oilType,
        'university': _university,
        'disabled': _disabled,
        'id': _id,
        'vv': _vv,
        'price': _price,
        'added_liters': _addedLiters,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bus_number': serializeParam(
          _busNumber,
          ParamType.String,
        ),
        'driver_id': serializeParam(
          _driverId,
          ParamType.String,
        ),
        'driver_name': serializeParam(
          _driverName,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'current_counter': serializeParam(
          _currentCounter,
          ParamType.int,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'oil_type': serializeParam(
          _oilType,
          ParamType.String,
        ),
        'university': serializeParam(
          _university,
          ParamType.String,
        ),
        'disabled': serializeParam(
          _disabled,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'vv': serializeParam(
          _vv,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'added_liters': serializeParam(
          _addedLiters,
          ParamType.int,
        ),
      }.withoutNulls;

  static BusServicesModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BusServicesModelStruct(
        busNumber: deserializeParam(
          data['bus_number'],
          ParamType.String,
          false,
        ),
        driverId: deserializeParam(
          data['driver_id'],
          ParamType.String,
          false,
        ),
        driverName: deserializeParam(
          data['driver_name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        currentCounter: deserializeParam(
          data['current_counter'],
          ParamType.int,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        oilType: deserializeParam(
          data['oil_type'],
          ParamType.String,
          false,
        ),
        university: deserializeParam(
          data['university'],
          ParamType.String,
          false,
        ),
        disabled: deserializeParam(
          data['disabled'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        vv: deserializeParam(
          data['vv'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        addedLiters: deserializeParam(
          data['added_liters'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BusServicesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BusServicesModelStruct &&
        busNumber == other.busNumber &&
        driverId == other.driverId &&
        driverName == other.driverName &&
        type == other.type &&
        date == other.date &&
        currentCounter == other.currentCounter &&
        notes == other.notes &&
        oilType == other.oilType &&
        university == other.university &&
        disabled == other.disabled &&
        id == other.id &&
        vv == other.vv &&
        price == other.price &&
        addedLiters == other.addedLiters;
  }

  @override
  int get hashCode => const ListEquality().hash([
        busNumber,
        driverId,
        driverName,
        type,
        date,
        currentCounter,
        notes,
        oilType,
        university,
        disabled,
        id,
        vv,
        price,
        addedLiters
      ]);
}

BusServicesModelStruct createBusServicesModelStruct({
  String? busNumber,
  String? driverId,
  String? driverName,
  String? type,
  String? date,
  int? currentCounter,
  String? notes,
  String? oilType,
  String? university,
  bool? disabled,
  String? id,
  int? vv,
  int? price,
  int? addedLiters,
}) =>
    BusServicesModelStruct(
      busNumber: busNumber,
      driverId: driverId,
      driverName: driverName,
      type: type,
      date: date,
      currentCounter: currentCounter,
      notes: notes,
      oilType: oilType,
      university: university,
      disabled: disabled,
      id: id,
      vv: vv,
      price: price,
      addedLiters: addedLiters,
    );
