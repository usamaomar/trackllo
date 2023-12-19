import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/gas_component/gas_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'gas_changere_cords_page_widget.dart' show GasChangereCordsPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GasChangereCordsPageModel
    extends FlutterFlowModel<GasChangereCordsPageWidget> {
  ///  Local state fields for this page.

  List<BusServicesModelStruct> listOfGas = [];
  void addToListOfGas(BusServicesModelStruct item) => listOfGas.add(item);
  void removeFromListOfGas(BusServicesModelStruct item) =>
      listOfGas.remove(item);
  void removeAtIndexFromListOfGas(int index) => listOfGas.removeAt(index);
  void insertAtIndexInListOfGas(int index, BusServicesModelStruct item) =>
      listOfGas.insert(index, item);
  void updateListOfGasAtIndex(
          int index, Function(BusServicesModelStruct) updateFn) =>
      listOfGas[index] = updateFn(listOfGas[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (RecordsBusServicesApi)] action in GasChangereCordsPage widget.
  ApiCallResponse? apiResultyty;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
