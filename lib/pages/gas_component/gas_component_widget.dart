import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gas_component_model.dart';
export 'gas_component_model.dart';

class GasComponentWidget extends StatefulWidget {
  const GasComponentWidget({super.key});

  @override
  _GasComponentWidgetState createState() => _GasComponentWidgetState();
}

class _GasComponentWidgetState extends State<GasComponentWidget> {
  late GasComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GasComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 350.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).info,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xAE2F19FC),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.apiResultix89 =
                                      await BusServicesApiCall.call(
                                    token: FFAppState().UserModelAppState.token,
                                    busNumber:
                                        FFAppState().UserModelAppState.ssi,
                                    driverId: FFAppState().UserModelAppState.id,
                                    driverName:
                                        FFAppState().UserModelAppState.name,
                                    type: 'petrol',
                                    date: getCurrentTimestamp.toString(),
                                    petrolLitre: _model.textController2.text,
                                    currentCounter: _model.textController1.text,
                                    price: _model.textController3.text,
                                  );
                                  if ((_model.apiResultix89?.succeeded ??
                                          true) ==
                                      true) {
                                    setState(() {});
                                    Navigator.pop(context);
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('title'),
                                          content: Text(
                                              (_model.apiResultix89?.bodyText ??
                                                  '')),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'mm0vrt49' /* Save */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      34.0, 0.0, 34.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).info,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xAE2F19FC),
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'oqicxa0j' /* Gas Change */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 14.0,
                                  ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_sharp,
                                color: FlutterFlowTheme.of(context).info,
                                size: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '52se8dtd' /* Meter reading while filling */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF032734),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'ne0cwiwk' /* Quantity packed in litres */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF032734),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _model.textController3,
                        focusNode: _model.textFieldFocusNode3,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '50cth9so' /* The cash value */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF032734),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.textController3Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
