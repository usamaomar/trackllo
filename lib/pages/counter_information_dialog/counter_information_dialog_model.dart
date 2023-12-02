import '/flutter_flow/flutter_flow_util.dart';
import 'counter_information_dialog_widget.dart'
    show CounterInformationDialogWidget;
import 'package:flutter/material.dart';

class CounterInformationDialogModel
    extends FlutterFlowModel<CounterInformationDialogWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? localUploadedImage;

  bool isUploaded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
