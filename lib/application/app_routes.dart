import 'package:flutter_driver_sample/application/module/counter/route/counter_module_router.dart';
import 'package:flutter_driver_sample/application/module/login/route/login_module_router.dart';
import 'package:go_router/go_router.dart';

import 'module/list_items/route/list_items_routes.dart';


final GoRouter appModuleRouter = GoRouter(
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      loginModuleRouter,
      counterModuleRouter,
      listItemModuleRouter
    ]
);