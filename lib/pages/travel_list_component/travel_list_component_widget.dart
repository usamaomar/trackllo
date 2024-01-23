import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'travel_list_component_model.dart';
export 'travel_list_component_model.dart';

class TravelListComponentWidget extends StatefulWidget {
  const TravelListComponentWidget({super.key});

  @override
  _TravelListComponentWidgetState createState() =>
      _TravelListComponentWidgetState();
}

class _TravelListComponentWidgetState extends State<TravelListComponentWidget>
    with TickerProviderStateMixin {
  late TravelListComponentModel _model;

  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TravelListComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoading = true;
      });
      _model.apiResult3dp = await GetTravelsListApiCall.call(
        token: FFAppState().UserModelAppState.token,
      );
      if ((_model.apiResult3dp?.succeeded ?? true)) {
        setState(() {
          _model.isLoading = false;
        });
        setState(() {
          _model.jsonObjct = getJsonField(
            (_model.apiResult3dp?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
              .toList()
              .cast<dynamic>();
        });
      } else {
        setState(() {
          _model.isLoading = false;
        });
      }
    });
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
          height: 360.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).info,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
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
                                  0.0, 20.0, 0.0, 20.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'a9et6heg' /* Travel Selection */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                    ),
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
              Stack(
                alignment: const AlignmentDirectional(0.0, 0.0),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                      ),
                      child: Builder(
                        builder: (context) {
                          final listLocs =
                              _model.jsonObjct.map((e) => e).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listLocs.length,
                            itemBuilder: (context, listLocsIndex) {
                              final listLocsItem = listLocs[listLocsIndex];
                              return Opacity(
                                opacity: getJsonField(
                                          listLocsItem,
                                          r'''$._id''',
                                        ) ==
                                        getJsonField(
                                          FFAppState().travilLine,
                                          r'''$._id''',
                                        )
                                    ? 0.5
                                    : 1.0,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 10.0, 24.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (getJsonField(
                                            listLocsItem,
                                            r'''$._id''',
                                          ) !=
                                          getJsonField(
                                            FFAppState().travilLine,
                                            r'''$._id''',
                                          )) {
                                        _model.apiResulth6xCopy =
                                        await StartTripApiCall.call(
                                            token: FFAppState()
                                                .UserModelAppState
                                                .token,
                                            travelId: getJsonField(
                                              listLocsItem,
                                              r'''$._id''',
                                            ).toString(),
                                            driverId: FFAppState()
                                                .UserModelAppState
                                                .id,
                                            day: functions.dateFromat(),
                                            isFinished: false,
                                            busId: FFAppState().assighnedModel.busID);
                                        if ((_model
                                                .apiResulth6xCopy?.succeeded ??
                                            true)) {
                                          FFAppState().update(() {
                                            FFAppState().travilLine = null;
                                          });
                                          setState(() {
                                            FFAppState().tripIdToBeCanceld = getJsonField(
                                              (_model.apiResulth6xCopy?.jsonBody ?? ''),
                                              r'''$.data._id''',
                                            ).toString();

                                            FFAppState().travilLine =
                                                listLocsItem;
                                          });
                                          Navigator.pop(context);///"_id" -> "6586b18287ae959a92f4bb62"
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText: 'Trip is selected',
                                                  arText: 'تم تحديد الرحلة',
                                                ),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  enText: 'Alert',
                                                  arText: 'تنبيه',
                                                )),
                                                content: Text((_model
                                                        .apiResulth6xCopy
                                                        ?.bodyText ??
                                                    '')),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      enText: 'Ok',
                                                      arText: 'حسنا',
                                                    )),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.house_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 30.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    '${getJsonField(
                                                      listLocsItem,
                                                      r'''$.travel_start_name''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                if (FFAppState()
                                                        .currentLanguge ==
                                                    'en')
                                                  Icon(
                                                    Icons.double_arrow,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                if (FFAppState()
                                                        .currentLanguge ==
                                                    'ar')
                                                  Icon(
                                                    Icons
                                                        .keyboard_double_arrow_left_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 30.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    '${getJsonField(
                                                      listLocsItem,
                                                      r'''$.travel_end_name''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  if (_model.isLoading == true)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: CircularPercentIndicator(
                          percent: 0.5,
                          radius: 25.0,
                          lineWidth: 5.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                        ).animateOnPageLoad(
                            animationsMap['progressBarOnPageLoadAnimation']!),
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
