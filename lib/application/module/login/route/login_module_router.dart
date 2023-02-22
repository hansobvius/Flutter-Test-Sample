import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/login.dart';

final GoRouter loginModuleRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: 'login',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      }
    )
  ]
);