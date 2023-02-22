import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/home/ui/counter_result.dart';
import 'package:go_router/go_router.dart';
import '../ui/home.dart';

/// Home Module Router
///

final GoRoute homeModuleRouter = GoRoute(
    name: 'home',
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const Home(title: 'Flutter integration test sample');
    },
    routes: <GoRoute>[
      GoRoute(
          name: 'counter_result',
          path: 'counter_result',
          builder: (BuildContext context, GoRouterState state) {
            return CounterResult(counterResultValue: state.queryParams['counterResultValue']!);
          }
      )
    ]
);