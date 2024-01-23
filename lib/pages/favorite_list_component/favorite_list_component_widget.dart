import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'favorite_list_component_model.dart';
export 'favorite_list_component_model.dart';

class FavoriteListComponentWidget extends StatefulWidget {
  const FavoriteListComponentWidget({Key? key}) : super(key: key);

  @override
  _FavoriteListComponentWidgetState createState() =>
      _FavoriteListComponentWidgetState();
}

class _FavoriteListComponentWidgetState
    extends State<FavoriteListComponentWidget> with TickerProviderStateMixin {
  late FavoriteListComponentModel _model;

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
    _model = createModel(context, () => FavoriteListComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoading = true;
      });
      _model.apiResult3dp = await UnAssignedCall.call(
        token: FFAppState().UserModelAppState.token,
      );
      if ((_model.apiResult3dp?.succeeded ?? true)) {
        _model.favs = await FavoritesCall.call(
          token: FFAppState().UserModelAppState.token,
        );
        if ((_model.favs?.succeeded ?? true)) {
          setState(() {
            _model.favjsonObjct = getJsonField(
              (_model.favs?.jsonBody ?? ''),
              r'''$.favoriteTravels''',
              true,
            )!
                .toList()
                .cast<dynamic>();
          });
        }
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
        padding: EdgeInsets.all(30.0),
        child: Container(
          height: 360.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).info,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xAE2F19FC),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'qb932knp' /* Favorite */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final listLocsFavs =
                                _model.favjsonObjct.map((e) => e).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listLocsFavs.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, listLocsFavsIndex) {
                                final listLocsFavsItem =
                                    listLocsFavs[listLocsFavsIndex];
                                return Opacity(
                                  opacity: getJsonField(
                                            listLocsFavsItem,
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
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                    onTap: () async {
                                                      setState(() => _model
                                                              .inSelected =
                                                          !_model.inSelected);
                                                      setState(() {
                                                        _model.isLoading =
                                                        true;
                                                      });
                                                      _model.smm = await AddRemovefavoritesCall
                                                          .call(
                                                              token: FFAppState()
                                                                  .UserModelAppState
                                                                  .token,
                                                              favoriteTravelsList:
                                                                  remove(
                                                                      getJsonField(
                                                                        listLocsFavsItem,
                                                                        r'''$._id''',
                                                                        true,
                                                                      )[0],
                                                                      getJsonField(
                                                                        _model
                                                                            .favjsonObjct
                                                                            .map((e) => e)
                                                                            .toList(),
                                                                        r'''$[:]._id''',
                                                                        true,
                                                                      ) == null ? [] :

                                                                      getJsonField(
                                                                        _model
                                                                            .favjsonObjct
                                                                            .map((e) => e)
                                                                            .toList(),
                                                                        r'''$[:]._id''',
                                                                        true,
                                                                      )
                                                                          .whereType<String>()
                                                                          .toList()

                                                                    )
                                                      );

                                                      if ((_model
                                                              .smm?.succeeded ??
                                                          true)) {
                                                        setState(() {});
                                                      }
                                                      _model.apiResultpl8 =
                                                          await UnAssignedCall
                                                              .call(
                                                        token: FFAppState()
                                                            .UserModelAppState
                                                            .token,
                                                      );
                                                      if ((_model.apiResultpl8
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model.jsonObjct =
                                                              getJsonField(
                                                                (_model.apiResultpl8
                                                                    ?.jsonBody ??
                                                                    ''),
                                                                r'''$.data''',
                                                                true,
                                                              )!
                                                                  .toList()
                                                                  .cast<
                                                                  dynamic>();
                                                        });
                                                      }
                                                      _model.apiResultmj1 =
                                                          await FavoritesCall
                                                              .call(
                                                        token: FFAppState()
                                                            .UserModelAppState
                                                            .token,
                                                      );
                                                      if ((_model.apiResultmj1
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model.favjsonObjct =
                                                              getJsonField(
                                                            (_model.apiResultmj1
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.favoriteTravels''',
                                                            true,
                                                          )!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                        });
                                                      }

                                                      setState(() {
                                                        _model.isLoading =
                                                        false;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.star_sharp,
                                                      color: Color(0xFFFF9900),
                                                      size: 25.0,
                                                    )),
                                              ],
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.house_sharp,
                                                        color:
                                                            Color(0xFF527ED2),
                                                        size: 30.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${getJsonField(
                                                            listLocsFavsItem,
                                                            r'''$.travel_start_name''',
                                                          ).toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFF527ED2),
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color:
                                                            Color(0xFFD29B52),
                                                        size: 30.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${getJsonField(
                                                            listLocsFavsItem,
                                                            r'''$.travel_end_name''',
                                                          ).toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFFD29B52),
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.isLoading = true;
                                                    });
                                                    _model.apiResulth6xCopy =
                                                        await StartTripApiCall
                                                            .call(
                                                      token: FFAppState()
                                                          .UserModelAppState
                                                          .token,
                                                      travelId: getJsonField(
                                                        listLocsFavsItem,
                                                        r'''$._id''',
                                                      ).toString(),
                                                      driverId: FFAppState()
                                                          .UserModelAppState
                                                          .id,
                                                     busId: FFAppState().assighnedModel.busID,
                                                      day: functions
                                                          .dateFromat(),
                                                      isFinished: false,
                                                    );
                                                    if ((_model.apiResulth6xCopy
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        FFAppState().tripIdToBeCanceld = getJsonField(
                                                          (_model.apiResulth6xCopy?.jsonBody ?? ''),
                                                          r'''$.data._id''',
                                                        ).toString();
                                                        FFAppState().update(() {
                                                          FFAppState().travilLine =
                                                              listLocsFavsItem;
                                                        });
                                                      });
                                                      setState(() {
                                                        _model.isLoading = false;
                                                      });
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  'Trip is selected',
                                                              arText:
                                                                  'تم تحديد الرحلة',
                                                            ),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                FFLocalizations.of(
                                                                        context)
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
                                                                child: Text(FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText: 'Ok',
                                                                  arText:
                                                                      'حسنا',
                                                                )),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF527ED2),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                5.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                5.0),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '8vvolod7' /* Start Trip  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
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
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final listLocs =
                                    _model.jsonObjct.map((e) => e).toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: listLocs.length,
                                  itemBuilder: (context, listLocsIndex) {
                                    final listLocsItem =
                                        listLocs[listLocsIndex];
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(5.0),
                                                topLeft: Radius.circular(5.0),
                                                topRight: Radius.circular(5.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.house_sharp,
                                                            color: Color(
                                                                0xFF527ED2),
                                                            size: 30.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${getJsonField(
                                                                listLocsItem,
                                                                r'''$.travel_start_name''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xFF527ED2),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.location_on,
                                                            color: Color(
                                                                0xFFD29B52),
                                                            size: 30.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${getJsonField(
                                                                listLocsItem,
                                                                r'''$.travel_end_name''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xFFD29B52),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        setState(() => _model
                                                                .inSelected =
                                                            !_model.inSelected);
                                                        setState(() {
                                                          _model.isLoading =
                                                              true;
                                                        });
                                                        _model.apiResultv8o = await AddRemovefavoritesCall
                                                            .call(
                                                                token: FFAppState()
                                                                    .UserModelAppState
                                                                    .token,
                                                                favoriteTravelsList:
                                                                    addAllFavs(
                                                                        getJsonField(
                                                                          listLocsItem,
                                                                          r'''$._id''',
                                                                          true,
                                                                        )[0],

                                                                        getJsonField(
                                                                          _model
                                                                              .favjsonObjct
                                                                              .map((e) => e)
                                                                              .toList(),
                                                                          r'''$[:]._id''',
                                                                          true,
                                                                        ) == null ? [] :


                                                                        getJsonField(
                                                                          _model
                                                                              .favjsonObjct
                                                                              .map((e) => e)
                                                                              .toList(),
                                                                          r'''$[:]._id''',
                                                                          true,
                                                                        )
                                                                            .whereType<String>()
                                                                            .toList()));
                                                        if ((_model.apiResultv8o
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.apiResult3dpd =
                                                              await UnAssignedCall
                                                                  .call(
                                                            token: FFAppState()
                                                                .UserModelAppState
                                                                .token,
                                                          );
                                                          if ((_model
                                                                  .apiResult3dpd
                                                                  ?.succeeded ??
                                                              true)) {

                                                            setState(() {
                                                              _model.jsonObjct =
                                                                  getJsonField(
                                                                (_model.apiResult3dpd
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.data''',
                                                                true,
                                                              )!
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                            });
                                                          } else {
                                                            setState(() {
                                                              _model.isLoading =
                                                                  false;
                                                            });
                                                          }

                                                          _model.apiResultq0z =
                                                              await FavoritesCall
                                                                  .call(
                                                            token: FFAppState()
                                                                .UserModelAppState
                                                                .token,
                                                          );
                                                          if ((_model
                                                                  .apiResultq0z
                                                                  ?.succeeded ??
                                                              true)) {

                                                            setState(() {
                                                              _model.favjsonObjct =
                                                                  getJsonField(
                                                                (_model.apiResultq0z
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.favoriteTravels''',
                                                                true,
                                                              )!
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                            });
                                                          }

                                                          setState(() {
                                                            _model.isLoading =
                                                            false;
                                                          });
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.star_border,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )),
                      ],
                    )
                  ],
                ),
              ),
              if (_model.isLoading == true)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
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
        ),
      ),
    );
  }

  List<String> addAllFavs(String currentId, List<String> otherListItems) {
    List<String> list = [];
    list.addAll(otherListItems);
    list.add(currentId);
    return list;
  }

  List<String> remove(String currentId, List<String> otherListItems) {
    List<String> list = [];
    list.addAll(otherListItems);
    list.removeWhere((element) => element == currentId);
    return list;
  }
}
