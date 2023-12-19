import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'counter_information_dialog_widget.dart'
    show CounterInformationDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CounterInformationDialogModel
    extends FlutterFlowModel<CounterInformationDialogWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? localUploadedImage;

  bool isUploaded = false;

  String localImageBase46 = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (DriverDailyImageSummaryApi)] action in Button widget.
  ApiCallResponse? apiResultdxj;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
