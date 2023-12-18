import 'dart:convert';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'side_menu_component_model.dart';
export 'side_menu_component_model.dart';

class SideMenuComponentWidget extends StatefulWidget {
  const SideMenuComponentWidget({super.key});

  @override
  _SideMenuComponentWidgetState createState() =>
      _SideMenuComponentWidgetState();
}

class _SideMenuComponentWidgetState extends State<SideMenuComponentWidget> {
  late SideMenuComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideMenuComponentModel());
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
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 20.0, 10.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xAE2F19FC),
                                  width: 2.0,
                                ),
                              ),
                              // child: Visibility(
                              //   visible: FFAppState()
                              //           .UserModelAppState
                              //           .profilePhoto
                              //           .isEmpty
                              //       ? false
                              //       : true,
                              //   child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(150.0),
                              //       child: imageFromBase64String(FFAppState()
                              //           .UserModelAppState
                              //           .profilePhoto)),
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                FFAppState().UserModelAppState.name,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFF797979),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Icon(
                                  Icons.home,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'atmylffv' /* Home */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('GasChangereCordsPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Icon(
                                  Icons.gas_meter_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm7pzf71e' /* Fuel filling records */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('OilChangereCordsPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Icon(
                                  Icons.oil_barrel,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'gce65n6v' /* Oil change records */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('CounterInformationPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Icon(
                                  Icons.calculate,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'bjclm60c' /* Counter information */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFF797979),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('SettingsPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Icon(
                                  Icons.settings,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4vf6x3ie' /* Settings */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Aleart',
                                        arText: 'تنبيه',
                                      )),
                                      content: Text(FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Are you sure you want to logout',
                                        arText: 'هل انت متأكد من تسجيل الخروج',
                                      )),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText: 'Cancel',
                                            arText: 'الغاء',
                                          )),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText: 'Logout',
                                            arText: 'تسجيل الخروج',
                                          )),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              setState(() {
                                FFAppState().UserModelAppState =
                                    UserModelStruct();
                                FFAppState().locationAppState =
                                    LocationModelStruct();
                                FFAppState().travilLine = null;
                              });

                              context.goNamed('SplashPage');
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Icon(
                                  Icons.logout_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'y0vxiwob' /* Log Out */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image imageFromBase64String(String base64String) {
    Uint8List bytes = base64Decode(base64String);
    return Image.memory(
      bytes,
      width: 300.0,
      height: 200.0,
      fit: BoxFit.cover,
    );
  }
}
