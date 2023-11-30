import 'dart:convert';

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
  "bus_number": "$busNumber",
  "driver_id": "$driverId",
  "driver_name": "$driverName",
  "type": "$type",
  "date": "$date",
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
