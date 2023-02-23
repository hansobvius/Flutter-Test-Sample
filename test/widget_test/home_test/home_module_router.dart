import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/home/ui/counter_result.dart';
import 'package:flutter_driver_sample/application/module/home/ui/home.dart';
import 'package:go_router/go_router.dart';


/// Atomic router config for test purpose
final GoRouter homeModuleRouter = GoRouter(
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
      name: 'home',
          path: '/',
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
      )
    ]
);