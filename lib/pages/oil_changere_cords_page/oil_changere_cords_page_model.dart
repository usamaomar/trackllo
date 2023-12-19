import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/oile_component/oile_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'oil_changere_cords_page_widget.dart' show OilChangereCordsPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OilChangereCordsPageModel
    extends FlutterFlowModel<OilChangereCordsPageWidget> {
  ///  Local state fields for this page.

  List<BusServicesModelStruct> listOfOile = [];
  void addToListOfOile(BusServicesModelStruct item) => listOfOile.add(item);
  void removeFromListOfOile(BusServicesModelStruct item) =>
      listOfOile.remove(item);
  void removeAtIndexFromListOfOile(int index) => listOfOile.removeAt(index);
  void insertAtIndexInListOfOile(int index, BusServicesModelStruct item) =>
      listOfOile.insert(index, item);
  void updateListOfOileAtIndex(
          int index, Function(BusServicesModelStruct) updateFn) =>
      listOfOile[index] = updateFn(listOfOile[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (RecordsBusServicesApi)] action in OilChangereCordsPage widget.
  ApiCallResponse? apiResultyty4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
