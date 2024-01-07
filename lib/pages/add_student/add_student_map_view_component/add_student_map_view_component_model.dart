import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/add_student/add_passengers_number_dialog_component/add_passengers_number_dialog_component_widget.dart';
import '/pages/add_student/add_student_counter_component/add_student_counter_component_widget.dart';
import 'add_student_map_view_component_widget.dart'
    show AddStudentMapViewComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddStudentMapViewComponentModel
    extends FlutterFlowModel<AddStudentMapViewComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AddStudentCounterComponent component.
  late AddStudentCounterComponentModel addStudentCounterComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addStudentCounterComponentModel =
        createModel(context, () => AddStudentCounterComponentModel());
  }

  void dispose() {
    addStudentCounterComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
