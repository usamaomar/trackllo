import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/add_student/add_passengers_number_dialog_component/add_passengers_number_dialog_component_widget.dart';
import '/pages/add_student/add_student_counter_component/add_student_counter_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_student_map_view_component_model.dart';
export 'add_student_map_view_component_model.dart';

class AddStudentMapViewComponentWidget extends StatefulWidget {
  const AddStudentMapViewComponentWidget({Key? key}) : super(key: key);

  @override
  _AddStudentMapViewComponentWidgetState createState() =>
      _AddStudentMapViewComponentWidgetState();
}

class _AddStudentMapViewComponentWidgetState
    extends State<AddStudentMapViewComponentWidget> {
  late AddStudentMapViewComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddStudentMapViewComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 100.0,
          decoration: BoxDecoration(
            color: Color(0xFF6A5BF6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, -1.0)
                              .resolve(Directionality.of(context)),
                          child: AddPassengersNumberDialogComponentWidget(),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  text: FFLocalizations.of(context).getText(
                    'ddajcuv8' /* اضف عدد الركاب */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).info,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF6A5BF6),
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (FFAppState().numberOfStudents > 0)
          wrapWithModel(
            model: _model.addStudentCounterComponentModel,
            updateCallback: () => setState(() {}),
            child: AddStudentCounterComponentWidget(),
          ),
      ],
    );
  }
}
