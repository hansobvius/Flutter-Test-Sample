import 'package:flutter/material.dart';
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
      routerConfig: homeModuleRouter,
    );
  }
}