import 'package:flutter/material.dart';

class CounterResult extends StatelessWidget {

  final String counterResultValue;

  const CounterResult({super.key, required this.counterResultValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Result'),
      ),
      body: Center(
        child: Text(
          counterResultValue.toString(),
          key: const Key('COUNTER_RESULT'),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}