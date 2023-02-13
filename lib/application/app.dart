import 'package:flutter/material.dart';
import 'module/home/ui/home.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Integration Test Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter integration test sample'),
    );
  }
}