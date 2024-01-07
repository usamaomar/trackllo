import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/add_student/add_passengers_number_dialog_component/add_passengers_number_dialog_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_student_counter_component_model.dart';
export 'add_student_counter_component_model.dart';

class AddStudentCounterComponentWidget extends StatefulWidget {
  const AddStudentCounterComponentWidget({Key? key}) : super(key: key);

  @override
  _AddStudentCounterComponentWidgetState createState() =>
      _AddStudentCounterComponentWidgetState();
}

class _AddStudentCounterComponentWidgetState
    extends State<AddStudentCounterComponentWidget> {
  late AddStudentCounterComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddStudentCounterComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFF6A5BF6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'eohkt2hh' /* Passengers */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 18.0,
                  ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).info,
                  borderRadius: 5.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).info,
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFF0BBC0B),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().numberOfStudents =
                          FFAppState().numberOfStudents + 1;
                    });
                  },
                ),
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
                    text: FFAppState().numberOfStudents.toString(),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 5.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).info,
                  icon: Icon(
                    Icons.minimize_outlined,
                    color: Color(0xFFEA2903),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    if (FFAppState().numberOfStudents > 0) {
                      setState(() {
                        FFAppState().numberOfStudents =
                            FFAppState().numberOfStudents + -1;
                      });
                    } else {
                      setState(() {
                        FFAppState().numberOfStudents = 0;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
