import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CounterView extends StatefulWidget {
  
  const CounterView({super.key, required this.title});

  final String title;

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 11) {
        context.goNamed('counter_result', queryParams: {
          'counterResultValue' : _counter.toString()
        });
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
        focusColor: Colors.black87,
        child: const Icon(Icons.add),
      ),
    );
  }
}