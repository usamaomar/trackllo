import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_page_model.dart';
export 'splash_page_model.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({Key? key}) : super(key: key);

  @override
  _SplashPageWidgetState createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  late SplashPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      FFAppState().update(() {
        FFAppState().currentLanguge = FFAppState().currentLanguge != null &&
                FFAppState().currentLanguge != ''
            ? FFAppState().currentLanguge
            : 'ar';
      });
      setAppLanguage(context, FFAppState().currentLanguge);
      _model.apiResult2eb = await AssignedMeApiCall.call(
        token: FFAppState().UserModelAppState.token,
      );
      if ((_model.apiResult2eb?.succeeded ?? true)) {
        setState(() {
          FFAppState().assighnedModel =
              AsighnedMeModelStruct.maybeFromMap(getJsonField(
            (_model.apiResult2eb?.jsonBody ?? ''),
            r'''$''',
          ))!;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/XF.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          FlutterFlowTimer(
            initialTime: _model.timerMilliseconds,
            getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
              value,
              hours: false,
              milliSecond: false,
            ),
            controller: _model.timerController,
            updateStateInterval: Duration(milliseconds: 1000),
            onChanged: (value, displayTime, shouldUpdate) {
              _model.timerMilliseconds = value;
              _model.timerValue = displayTime;
              if (shouldUpdate) setState(() {});
            },
            onEnded: () async {
              if (FFAppState().UserModelAppState.token != null &&
                      FFAppState().UserModelAppState.token != ''
                  ? true
                  : false) {
                context.goNamed('TrackingPage');
              } else {
                context.goNamed('LoginPage');
              }
            },
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: Color(0x00FFFFFF),
                ),
          ),
        ],
      ),
    );
  }
}
