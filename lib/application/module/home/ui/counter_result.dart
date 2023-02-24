import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CounterResult extends StatelessWidget {

  final String counterResultValue;

  const CounterResult({super.key, required this.counterResultValue});

  void _navigate(BuildContext context) => context.goNamed('listItemView');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Result'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _navigate(context),
          child: Text(
            counterResultValue.toString(),
            key: const Key('COUNTER_RESULT'),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}