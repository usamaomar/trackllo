import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'favorite_list_component_widget.dart' show FavoriteListComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class FavoriteListComponentModel
    extends FlutterFlowModel<FavoriteListComponentWidget> {
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

  bool selected = true;

  bool inSelected = false;

  List<dynamic> favjsonObjct = [];
  void addToFavjsonObjct(dynamic item) => favjsonObjct.add(item);
  void removeFromFavjsonObjct(dynamic item) => favjsonObjct.remove(item);
  void removeAtIndexFromFavjsonObjct(int index) => favjsonObjct.removeAt(index);
  void insertAtIndexInFavjsonObjct(int index, dynamic item) =>
      favjsonObjct.insert(index, item);
  void updateFavjsonObjctAtIndex(int index, Function(dynamic) updateFn) =>
      favjsonObjct[index] = updateFn(favjsonObjct[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (unAssigned)] action in FavoriteListComponent widget.
  ApiCallResponse? apiResult3dp;
  // Stores action output result for [Backend Call - API (favorites)] action in FavoriteListComponent widget.
  ApiCallResponse? favs;
  // Stores action output result for [Backend Call - API (AddRemovefavorites)] action in ToggleIcon widget.
  ApiCallResponse? smm;
  // Stores action output result for [Backend Call - API (unAssigned)] action in ToggleIcon widget.
  ApiCallResponse? apiResultpl8;
  // Stores action output result for [Backend Call - API (favorites)] action in ToggleIcon widget.
  ApiCallResponse? apiResultmj1;
  // Stores action output result for [Backend Call - API (StartTripApi)] action in Container widget.
  ApiCallResponse? apiResulth6xCopy;
  // Stores action output result for [Backend Call - API (AddRemovefavorites)] action in ToggleIcon widget.
  ApiCallResponse? apiResultv8o;
  // Stores action output result for [Backend Call - API (unAssigned)] action in ToggleIcon widget.
  ApiCallResponse? apiResult3dpd;
  // Stores action output result for [Backend Call - API (favorites)] action in ToggleIcon widget.
  ApiCallResponse? apiResultq0z;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
