import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gas_changere_cords_page_widget.dart' show GasChangereCordsPageWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
