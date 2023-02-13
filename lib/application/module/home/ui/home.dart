import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 11) {
        context.go(context.namedLocation(
          'counter_result',
          params: <String, String>{
            'counterResultValue' : _counter.toString()
          }
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: const Key('COUNTER_TEXT'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('FLOATING_BUTTON_INCREMENT'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}