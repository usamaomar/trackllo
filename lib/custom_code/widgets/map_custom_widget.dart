// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MapCustomWidget extends StatefulWidget {
  const MapCustomWidget({
    Key? key,
    this.width,
    this.height,
    required this.readButton,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() readButton;

  @override
  _MapCustomWidgetState createState() => _MapCustomWidgetState();
}

class _MapCustomWidgetState extends State<MapCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
