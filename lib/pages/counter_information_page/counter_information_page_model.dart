import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'counter_information_page_widget.dart' show CounterInformationPageWidget;
import 'package:flutter/material.dart';

class CounterInformationPageModel
    extends FlutterFlowModel<CounterInformationPageWidget> {
  ///  Local state fields for this page.

  dynamic jsonObject;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getExpectedSpeedometerReadingApi)] action in CounterInformationPage widget.
  ApiCallResponse? apiResult4qr;

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
