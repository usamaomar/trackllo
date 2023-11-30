import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'oil_changere_cords_page_widget.dart' show OilChangereCordsPageWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
