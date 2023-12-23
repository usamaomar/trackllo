// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends BaseStruct {
  UserModelStruct({
    String? id,
    String? name,
    String? password,
    String? national,
    String? firebaseId,
    String? university,
    String? phone,
    String? profilePhoto,
    String? birthday,
    String? address,
    String? dateEnd,
    String? ssi,
    bool? disabled,
    String? driverLicense,
    String? licenseType,
    String? token,
    String? createdAt,
    String? updatedAt,
    String? vvv,
  })  : _id = id,
        _name = name,
        _password = password,
        _national = national,
        _firebaseId = firebaseId,
        _university = university,
        _phone = phone,
        _profilePhoto = profilePhoto,
        _birthday = birthday,
        _address = address,
        _dateEnd = dateEnd,
        _ssi = ssi,
        _disabled = disabled,
        _driverLicense = driverLicense,
        _licenseType = licenseType,
        _token = token,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _vvv = vvv;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  // "national" field.
  String? _national;
  String get national => _national ?? '';
  set national(String? val) => _national = val;
  bool hasNational() => _national != null;

  // "firebase_id" field.
  String? _firebaseId;
  String get firebaseId => _firebaseId ?? '';
  set firebaseId(String? val) => _firebaseId = val;
  bool hasFirebaseId() => _firebaseId != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  set university(String? val) => _university = val;
  bool hasUniversity() => _university != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "profile_photo" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  set profilePhoto(String? val) => _profilePhoto = val;
  bool hasProfilePhoto() => _profilePhoto != null;

  // "birthday" field.
  String? _birthday;
  String get birthday => _birthday ?? '';
  set birthday(String? val) => _birthday = val;
  bool hasBirthday() => _birthday != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "date_end" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  set dateEnd(String? val) => _dateEnd = val;
  bool hasDateEnd() => _dateEnd != null;

  // "ssi" field.
  String? _ssi;
  String get ssi => _ssi ?? '';
  set ssi(String? val) => _ssi = val;
  bool hasSsi() => _ssi != null;

  // "disabled" field.
  bool? _disabled;
  bool get disabled => _disabled ?? false;
  set disabled(bool? val) => _disabled = val;
  bool hasDisabled() => _disabled != null;

  // "driver_license" field.
  String? _driverLicense;
  String get driverLicense => _driverLicense ?? '';
  set driverLicense(String? val) => _driverLicense = val;
  bool hasDriverLicense() => _driverLicense != null;

  // "license_type" field.
  String? _licenseType;
  String get licenseType => _licenseType ?? '';
  set licenseType(String? val) => _licenseType = val;
  bool hasLicenseType() => _licenseType != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "vvv" field.
  String? _vvv;
  String get vvv => _vvv ?? '';
  set vvv(String? val) => _vvv = val;
  bool hasVvv() => _vvv != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        password: data['password'] as String?,
        national: data['national'] as String?,
        firebaseId: data['firebase_id'] as String?,
        university: data['university'] as String?,
        phone: data['phone'] as String?,
        profilePhoto: data['profile_photo'] as String?,
        birthday: data['birthday'] as String?,
        address: data['address'] as String?,
        dateEnd: data['date_end'] as String?,
        ssi: data['ssi'] as String?,
        disabled: data['disabled'] as bool?,
        driverLicense: data['driver_license'] as String?,
        licenseType: data['license_type'] as String?,
        token: data['token'] as String?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        vvv: data['vvv'] as String?,
      );

  static UserModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'password': _password,
        'national': _national,
        'firebase_id': _firebaseId,
        'university': _university,
        'phone': _phone,
        'profile_photo': _profilePhoto,
        'birthday': _birthday,
        'address': _address,
        'date_end': _dateEnd,
        'ssi': _ssi,
        'disabled': _disabled,
        'driver_license': _driverLicense,
        'license_type': _licenseType,
        'token': _token,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'vvv': _vvv,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'national': serializeParam(
          _national,
          ParamType.String,
        ),
        'firebase_id': serializeParam(
          _firebaseId,
          ParamType.String,
        ),
        'university': serializeParam(
          _university,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'profile_photo': serializeParam(
          _profilePhoto,
          ParamType.String,
        ),
        'birthday': serializeParam(
          _birthday,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'ssi': serializeParam(
          _ssi,
          ParamType.String,
        ),
        'disabled': serializeParam(
          _disabled,
          ParamType.bool,
        ),
        'driver_license': serializeParam(
          _driverLicense,
          ParamType.String,
        ),
        'license_type': serializeParam(
          _licenseType,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'vvv': serializeParam(
          _vvv,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        national: deserializeParam(
          data['national'],
          ParamType.String,
          false,
        ),
        firebaseId: deserializeParam(
          data['firebase_id'],
          ParamType.String,
          false,
        ),
        university: deserializeParam(
          data['university'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        profilePhoto: deserializeParam(
          data['profile_photo'],
          ParamType.String,
          false,
        ),
        birthday: deserializeParam(
          data['birthday'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        dateEnd: deserializeParam(
          data['date_end'],
          ParamType.String,
          false,
        ),
        ssi: deserializeParam(
          data['ssi'],
          ParamType.String,
          false,
        ),
        disabled: deserializeParam(
          data['disabled'],
          ParamType.bool,
          false,
        ),
        driverLicense: deserializeParam(
          data['driver_license'],
          ParamType.String,
          false,
        ),
        licenseType: deserializeParam(
          data['license_type'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
        vvv: deserializeParam(
          data['vvv'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserModelStruct &&
        id == other.id &&
        name == other.name &&
        password == other.password &&
        national == other.national &&
        firebaseId == other.firebaseId &&
        university == other.university &&
        phone == other.phone &&
        profilePhoto == other.profilePhoto &&
        birthday == other.birthday &&
        address == other.address &&
        dateEnd == other.dateEnd &&
        ssi == other.ssi &&
        disabled == other.disabled &&
        driverLicense == other.driverLicense &&
        licenseType == other.licenseType &&
        token == other.token &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        vvv == other.vvv;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        password,
        national,
        firebaseId,
        university,
        phone,
        profilePhoto,
        birthday,
        address,
        dateEnd,
        ssi,
        disabled,
        driverLicense,
        licenseType,
        token,
        createdAt,
        updatedAt,
        vvv
      ]);
}

UserModelStruct createUserModelStruct({
  String? id,
  String? name,
  String? password,
  String? national,
  String? firebaseId,
  String? university,
  String? phone,
  String? profilePhoto,
  String? birthday,
  String? address,
  String? dateEnd,
  String? ssi,
  bool? disabled,
  String? driverLicense,
  String? licenseType,
  String? token,
  String? createdAt,
  String? updatedAt,
  String? vvv,
}) =>
    UserModelStruct(
      id: id,
      name: name,
      password: password,
      national: national,
      firebaseId: firebaseId,
      university: university,
      phone: phone,
      profilePhoto: profilePhoto,
      birthday: birthday,
      address: address,
      dateEnd: dateEnd,
      ssi: ssi,
      disabled: disabled,
      driverLicense: driverLicense,
      licenseType: licenseType,
      token: token,
      createdAt: createdAt,
      updatedAt: updatedAt,
      vvv: vvv,
    );
