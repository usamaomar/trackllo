import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/side_menu_component/side_menu_component_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'tracking_page_widget.dart' show TrackingPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackingPageModel extends FlutterFlowModel<TrackingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (StartTripApi)] action in MapCustomWidget widget.
  ApiCallResponse? apiResultf61;
  // Stores action output result for [Backend Call - API (AddBusTrackToBeginLiveLocationApi)] action in MapCustomWidget widget.
  ApiCallResponse? apiResultr6q;
  // Stores action output result for [Backend Call - API (LiveLocationApi)] action in MapCustomWidget widget.
  ApiCallResponse? apiResult0b0;
  // Stores action output result for [Backend Call - API (EndTripApi)] action in MapCustomWidget widget.
  ApiCallResponse? apiResult5x0;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for SideMenuComponent component.
  late SideMenuComponentModel sideMenuComponentModel1;
  // Model for SideMenuComponent component.
  late SideMenuComponentModel sideMenuComponentModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideMenuComponentModel1 =
        createModel(context, () => SideMenuComponentModel());
    sideMenuComponentModel2 =
        createModel(context, () => SideMenuComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideMenuComponentModel1.dispose();
    sideMenuComponentModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
