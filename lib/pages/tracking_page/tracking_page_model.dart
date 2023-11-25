import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/side_menu_component/side_menu_component_widget.dart';
import 'tracking_page_widget.dart' show TrackingPageWidget;
import 'package:flutter/material.dart';

class TrackingPageModel extends FlutterFlowModel<TrackingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for SideMenuComponent component.
  late SideMenuComponentModel sideMenuComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuComponentModel =
        createModel(context, () => SideMenuComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
