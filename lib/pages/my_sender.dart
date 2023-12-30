import 'dart:async';

import 'package:tracllo_driver_system/app_state.dart';

import '../backend/api_requests/api_calls.dart';
import '../backend/schema/structs/offline_model_struct.dart';

class MySender {
  static final MySender _singleton = new MySender._internal();
  MySender._internal();
  static MySender getInstance() => _singleton;
  Timer? timer;
  void startSending(int intervalMilliseconds) {
    timer =
        Timer.periodic(Duration(milliseconds: intervalMilliseconds), (timer) {
          if (FFAppState().appStateOfflineModel.isNotEmpty) {
            OfflineModelStruct valueToSend = FFAppState().appStateOfflineModel.removeAt(0);
            print("number of items ${FFAppState().appStateOfflineModel.length}");
            print("sending");
            send(valueToSend);
          } else {
            print("number of items ${FFAppState().appStateOfflineModel.length}");
            print("stopping");
            timer.cancel();
          }
        });
  }

  void stopSending() {
    timer?.cancel();
  }

  void send(OfflineModelStruct value) async {
    ApiCallResponse? apiResult0b0 = await LiveLocationApiCall.call(
      token: value.token,
      busNumber: value.busNumber,
      lat: double.parse(value.lat),
      lng: double.parse(value.lng),
      userName: value.userName,
      user: value.user,
      status: 'e',
      confidence: 0,
      batteryLevel: 0,
      batteryCharging: true,
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      isMoving: true,
      time: int.parse(value.time),
      deviceId: '0',
      speed: 90,
      heading: 0,
      movingType: 'e',
      event: 'e',
      phonrModel: 'x7',
      platform: 'android',
      university: value.university,
      bus: value.bus,
      busIdentity: value.busIdentity,
      isOfflineLocation: true
    );
    if(apiResult0b0.succeeded){
      print("object");
    }else{
      print("object");
    }
  }

}
