// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AsighnedMeModelStruct extends BaseStruct {
  AsighnedMeModelStruct({
    String? busID,
    String? busIdentity,
  })  : _busID = busID,
        _busIdentity = busIdentity;

  // "busID" field.
  String? _busID;
  String get busID => _busID ?? '';
  set busID(String? val) => _busID = val;
  bool hasBusID() => _busID != null;

  // "busIdentity" field.
  String? _busIdentity;
  String get busIdentity => _busIdentity ?? '';
  set busIdentity(String? val) => _busIdentity = val;
  bool hasBusIdentity() => _busIdentity != null;

  static AsighnedMeModelStruct fromMap(Map<String, dynamic> data) =>
      AsighnedMeModelStruct(
        busID: data['busID'] as String?,
        busIdentity: data['busIdentity'] as String?,
      );

  static AsighnedMeModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AsighnedMeModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'busID': _busID,
        'busIdentity': _busIdentity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'busID': serializeParam(
          _busID,
          ParamType.String,
        ),
        'busIdentity': serializeParam(
          _busIdentity,
          ParamType.String,
        ),
      }.withoutNulls;

  static AsighnedMeModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AsighnedMeModelStruct(
        busID: deserializeParam(
          data['busID'],
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
  String toString() => 'AsighnedMeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AsighnedMeModelStruct &&
        busID == other.busID &&
        busIdentity == other.busIdentity;
  }

  @override
  int get hashCode => const ListEquality().hash([busID, busIdentity]);
}

AsighnedMeModelStruct createAsighnedMeModelStruct({
  String? busID,
  String? busIdentity,
}) =>
    AsighnedMeModelStruct(
      busID: busID,
      busIdentity: busIdentity,
    );
