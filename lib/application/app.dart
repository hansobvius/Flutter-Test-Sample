import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/login/route/login_module_router.dart';
import 'package:flutter_driver_sample/application/app_routes.dart';
import 'module/home/route/home_module_router.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Integration Test Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: appModuleRouter,
    );
  }
}