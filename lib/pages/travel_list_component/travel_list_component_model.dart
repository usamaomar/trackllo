import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'travel_list_component_widget.dart' show TravelListComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class TravelListComponentModel
    extends FlutterFlowModel<TravelListComponentWidget> {
  ///  Local state fields for this component.

  List<dynamic> jsonObjct = [];
  void addToJsonObjct(dynamic item) => jsonObjct.add(item);
  void removeFromJsonObjct(dynamic item) => jsonObjct.remove(item);
  void removeAtIndexFromJsonObjct(int index) => jsonObjct.removeAt(index);
  void insertAtIndexInJsonObjct(int index, dynamic item) =>
      jsonObjct.insert(index, item);
  void updateJsonObjctAtIndex(int index, Function(dynamic) updateFn) =>
      jsonObjct[index] = updateFn(jsonObjct[index]);

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetTravelsListApi)] action in TravelListComponent widget.
  ApiCallResponse? apiResult3dp;
  // Stores action output result for [Backend Call - API (StartTripApi)] action in Container widget.
  ApiCallResponse? apiResulth6xCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
