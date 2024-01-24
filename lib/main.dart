import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:tracllo_driver_system/pages/connection_status_singleton.dart';
import 'package:tracllo_driver_system/pages/my_sender.dart';
import 'backend/api_requests/api_calls.dart';
import 'backend/api_requests/api_manager.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  await FlutterFlowTheme.initialize();

  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAnxO8vpdYpZMM-qzFGI6kaYxqWtx_hU_k",
            appId: "1:165279456167:ios:f26e63d5d4e7aa2ddef482",
            messagingSenderId: "165279456167",
            projectId: "com.tracllo.driver"));
  } else {
    await Firebase.initializeApp();
  }
  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  late MySender mySender;
  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  bool displaySplashImage = true;

  void connectionChanged(dynamic hasConnection) {
    Connectivity().checkConnectivity().then((ConnectivityResult result) async {
      if (result.name != 'none') {
        mySender.startSending(2000);
      } else {
        mySender.stopSending();
      }
    });
  }

  @override
  void initState() {
    FFAppState().appStateOfflineModel;
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    mySender = MySender.getInstance();
    connectionStatus.connectionChange.listen(connectionChanged);

    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);

    Future.delayed(const Duration(milliseconds: 1000),
        () => setState(() => _appStateNotifier.stopShowingSplashImage()));
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TraclloDriverSystem',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
