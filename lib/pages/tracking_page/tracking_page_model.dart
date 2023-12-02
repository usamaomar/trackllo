import '/flutter_flow/flutter_flow_util.dart';
import '/pages/side_menu_component/side_menu_component_widget.dart';
import 'tracking_page_widget.dart' show TrackingPageWidget;
import 'package:flutter/material.dart';

class TrackingPageModel extends FlutterFlowModel<TrackingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideMenuComponent component.
  late SideMenuComponentModel sideMenuComponentModel1;
  // Model for SideMenuComponent component.
  late SideMenuComponentModel sideMenuComponentModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuComponentModel1 =
        createModel(context, () => SideMenuComponentModel());
    sideMenuComponentModel2 =
        createModel(context, () => SideMenuComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuComponentModel1.dispose();
    sideMenuComponentModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
