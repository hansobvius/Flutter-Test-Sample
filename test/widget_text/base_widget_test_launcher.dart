import 'package:flutter/material.dart';

/// base widget to test single view
///

Widget initializeSingleView(Widget obj) {
  return MaterialApp(
    title: 'Flutter Integration Test Sample',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: obj,
  );
}