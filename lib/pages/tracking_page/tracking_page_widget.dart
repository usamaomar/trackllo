import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/favorite_list_component/favorite_list_component_widget.dart';
import '/pages/side_menu_component/side_menu_component_widget.dart';
import '/pages/travel_list_component/travel_list_component_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tracking_page_model.dart';
export 'tracking_page_model.dart';

class TrackingPageWidget extends StatefulWidget {
  const TrackingPageWidget({Key? key}) : super(key: key);

  @override
  _TrackingPageWidgetState createState() => _TrackingPageWidgetState();
}

class _TrackingPageWidgetState extends State<TrackingPageWidget> {
  late TrackingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).info,
        drawer: Container(
          width: 300.0,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sideMenuComponentModel1,
              updateCallback: () => setState(() {}),
              child: SideMenuComponentWidget(),
            ),
          ),
        ),
        endDrawer: Container(
          width: 300.0,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sideMenuComponentModel2,
              updateCallback: () => setState(() {}),
              child: SideMenuComponentWidget(),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              tabletLandscape: false,
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.MapCustomWidget(
                    width: double.infinity,
                    height: double.infinity,
                    locationRequstedAction: () async {
                      if (FFAppState().UseTrackToBiginApiAppState == true) {
                        _model.apiResultr6q =
                            await AddBusTrackToBeginLiveLocationApiCall.call(
                          token: FFAppState().UserModelAppState.token,
                          lat: FFAppState().locationAppState.lat.toString(),
                          lng: FFAppState().locationAppState.lng.toString(),
                          busId: getJsonField(
                            FFAppState().travilLine,
                            r'''$._id''',
                          ).toString(),
                        );
                        if ((_model.apiResultr6q?.succeeded ?? true)) {
                          setState(() {});
                        }
                      } else {
                        _model.apiResult0b0 = await LiveLocationApiCall.call(
                          token: FFAppState().UserModelAppState.token,
                          busNumber: FFAppState().UserModelAppState.ssi,
                          lat: FFAppState().locationAppState.lat,
                          lng: FFAppState().locationAppState.lng,
                          userName: FFAppState().UserModelAppState.name,
                          user: FFAppState().UserModelAppState.id,
                          status: 'e',
                          confidence: 0,
                          batteryLevel: 0,
                          batteryCharging: true,
                          accuracy: 0,
                          altitude: 0,
                          altitudeAccuracy: 0,
                          isMoving: true,
                          time: getCurrentTimestamp.millisecondsSinceEpoch,
                          deviceId: '0',
                          speed: 90,
                          heading: 0,
                          movingType: 'e',
                          event: 'e',
                          phonrModel: 'x7',
                          platform: 'android',
                          university: FFAppState().UserModelAppState.university,
                          bus: getJsonField(
                            FFAppState().travilLine,
                            r'''$._id''',
                          ).toString(),
                        );
                        if ((_model.apiResult0b0?.succeeded ?? true)) {
                          setState(() {});
                        }
                      }

                      setState(() {});
                    },
                    startTrip: () async {
                      _model.apiResultf61 = await StartTripApiCall.call(
                        token: FFAppState().UserModelAppState.token,
                        travelId: getJsonField(
                          FFAppState().travilLine,
                          r'''$.data._id''',
                        ).toString(),
                        driverId: FFAppState().UserModelAppState.id,
                        day: functions.dateFromat(),
                        isFinished: false,
                        busId: getJsonField(
                          functions.findBusByUserId(
                              getJsonField(
                                FFAppState().travilLine,
                                r'''$.bus''',
                                true,
                              )!,
                              FFAppState().UserModelAppState.id),
                          r'''$._id''',
                        ).toString(),
                      );
                      if ((_model.apiResultf61?.succeeded ?? true)) {
                        setState(() {
                          FFAppState().tripIdToBeCanceld = getJsonField(
                            (_model.apiResultf61?.jsonBody ?? ''),
                            r'''$.data._id''',
                          ).toString();
                        });
                      }

                      setState(() {});
                    },
                    stopTrip: () async {
                      _model.apiResult5x0 = await EndTripApiCall.call(
                        tripId: FFAppState().tripIdToBeCanceld,
                        token: FFAppState().UserModelAppState.token,
                      );
                      if ((_model.apiResult5x0?.succeeded ?? true)) {
                        FFAppState().update(() {
                          FFAppState().travilLine = null;
                        });
                        FFAppState().update(() {
                          FFAppState().tripIdToBeCanceld = '';
                        });
                      }

                      setState(() {});
                    },
                    travilLise: () async {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text(
                                FFLocalizations.of(context).getVariableText(
                              enText: 'Alert',
                              arText: 'تنبيه',
                            )),
                            content: Text(
                                FFLocalizations.of(context).getVariableText(
                              enText: 'You must choose a route for the trip',
                              arText: 'يتعين عليك اختيار مسار للرحلة',
                            )),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  enText: 'Ok',
                                  arText: 'حسنا',
                                )),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 45.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF347CE2),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.reorder_sharp,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (FFAppState().travilLine == null ? true : false)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child:
                                                  FavoriteListComponentWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Vector.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xAE2F19FC),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'tdr2806z' /* You Have To Select Trip */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child:
                                                            TravelListComponentWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'vp2rc41u' /* Trip */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        34.0, 0.0, 34.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Color(0xAE2F19FC),
                                                    ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
                Container(
                  width: 0.0,
                  height: 0.0,
                  decoration: BoxDecoration(),
                  child: FlutterFlowGoogleMap(
                    controller: _model.googleMapsController,
                    onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                    initialLocation: _model.googleMapsCenter ??=
                        LatLng(13.106061, -59.613158),
                    markerColor: GoogleMarkerColor.violet,
                    mapType: MapType.normal,
                    style: GoogleMapStyle.standard,
                    initialZoom: 14.0,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: true,
                    showLocation: true,
                    showCompass: false,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
