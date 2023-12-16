import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'travel_list_component_widget.dart' show TravelListComponentWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
