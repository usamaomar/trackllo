import 'dart:convert';
import 'dart:typed_data';
import 'package:tracllo_driver_system/app_state.dart';

import '../schema/structs/index.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginApiCall {
  static Future<ApiCallResponse> call({
    String? password = '',
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "$phone",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/login/driver',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BusServicesApiCall {
  static Future<ApiCallResponse> call({
    String? busNumber = '',
    String? driverId = '',
    String? token = '',
    String? driverName = '',
    String? type = '',
    String? date = '',
    String? petrolLitre = '',
    String? currentCounter = '',
    String? price = '',
    String? oilType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "type": "$type",
  "added_liters": "$petrolLitre",
  "current_counter": "$currentCounter",
  "price": "$price",
  "oil_type": "$oilType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BusServicesApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/bus-services',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LiveLocationApiCall {
  static Future<ApiCallResponse> call({
    String? busNumber = '',
    String? userName = '',
    String? token = '',
    String? user = '',
    double? lat,
    double? lng,
    String? status = '',
    int? confidence,
    int? batteryLevel,
    bool? batteryCharging,
    int? accuracy,
    int? altitude,
    int? altitudeAccuracy,
    bool? isMoving,
    int? time,
    String? deviceId = '',
    int? speed,
    int? heading,
    String? movingType = '',
    String? event = '',
    String? phonrModel = '',
    String? platform = '',
    String? university = '',
    String? bus = '',
    String? busIdentity = '',
    bool? isOfflineLocation,
  }) async {
    final ffApiRequestBody = '''
{
  "user_name": "${userName}",
  "user": "${user}",
  "lat": ${lat},
  "lng": ${lng},
  "status": "${status}",
  "confidence": ${confidence},
  "battery_level": ${batteryLevel},
  "battery_charging": ${batteryCharging},
  "accuracy": ${accuracy},
  "altitude": ${altitude},
  "altitude_accuracy": ${altitudeAccuracy},
  "is_moving": ${isMoving},
  "time": ${time},
  "device_id": "${deviceId}",
  "speed": ${speed},
  "heading": ${heading},
  "moving_type": "${movingType}",
  "event": "${event}",
  "phone_model": "${phonrModel}",
  "platform": "${platform}",
  "university": "${university}",
  "bus": "${bus}",
  "driverID": "${user}",
  "bus_identity": "$busIdentity",
   "isOffline": ${isOfflineLocation},
   "no_of_students_on_bus": ${FFAppState().numberOfStudents}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LiveLocationApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/live-location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StartTripApiCall {
  static Future<ApiCallResponse> call({
    String? travelId = '',
    String? driverId = '',
    String? token = '',
    String? day = '',
    bool? isFinished,
    String? busId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "travel_id": "$travelId",
  "driver_id": "$driverId",
  "day": "$day",
  "bus": "$busId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StartTripApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/start-trip',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EndTripApiCall {
  static Future<ApiCallResponse> call({
    String? tripId = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EndTripApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/end-trip/${tripId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddBusTrackToBeginLiveLocationApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? busId = '',
    String? lat = '',
    String? lng = '',
  }) async {
    final ffApiRequestBody = '''
{
  "busId": "$busId",
  "lat": "$lat",
  "lng": "$lng"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddBusTrackToBeginLiveLocationApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/bus/trackToBeginLiveLocation',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DriverDailyImageSummaryApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? speedometer,
    String? speedometerImg = '',
    String? lat = '',
    String? lng = '',
  }) async {
    final ffApiRequestBody = '''
{
  "speedometer": $speedometer,
  "speedometerImg": "$speedometerImg",
  "location": {
    "lat": "$lat",
    "lng": "$lng"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DriverDailyImageSummaryApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/driverdailysummary',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RecordsBusServicesApiCall {
  static Future<ApiCallResponse> call({
    String? busNumber = '',
    String? driverId = '',
    String? token = '',
    String? driverName = '',
    String? type = '',
    String? date = '',
    String? petrolLitre = '',
    String? currentCounter = '',
    String? price = '',
    String? oilType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'RecordsBusServicesApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/bus-services',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTravelsListApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTravelsListApi',
      apiUrl: 'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/travels',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetExpectedSpeedometerReadingApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getExpectedSpeedometerReadingApi',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/bus/expectedSpeedometerReading',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UnAssignedCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'unAssigned',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/travels/unassigned/unfavorite',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FavoritesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'favorites',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/travels/favorites',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddRemovefavoritesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    List<String>? favoriteTravelsList,
  }) async {
    final favoriteTravels = _serializeList(favoriteTravelsList);

    final ffApiRequestBody = '''
{
  "favoriteTravels": ${favoriteTravels}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddRemovefavorites',
      apiUrl:
          'https://tracllo-node-178a480f7a89.herokuapp.com/api/v1/travels/favorites',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
