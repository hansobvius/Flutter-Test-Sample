import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/list_items/ui/list_items_view.dart';
import 'package:go_router/go_router.dart';


/// Atomic router config for test purpose
final GoRouter listItemModuleRouter = GoRouter(
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
          name: 'listItemView',
          path: '/listItemView',
          builder: (BuildContext context, GoRouterState state) {
            return const ListItemsView();
          }
      )
    ]
);