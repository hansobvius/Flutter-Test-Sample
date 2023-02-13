import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/home.dart';

/// Home Module Router
///

GoRouter homeModuleRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Home(title: 'Flutter integration test sample');
        }
      )
    ]
);