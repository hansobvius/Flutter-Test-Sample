import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

Widget initializeSingleRouterView(GoRouter router) {
  return MaterialApp.router(
    title: 'Flutter Integration Test Sample',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routerConfig: router,
  );
}