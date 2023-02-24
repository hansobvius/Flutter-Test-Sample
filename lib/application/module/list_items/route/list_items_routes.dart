import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/list_items/ui/list_items_view.dart';
import 'package:go_router/go_router.dart';


final GoRoute listItemModuleRouter = GoRoute(
    name: 'listItemView',
    path: '/listItemView',
    builder: (BuildContext context, GoRouterState state) {
      return const ListItemsView();
    }
);