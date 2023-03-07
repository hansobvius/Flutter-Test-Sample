import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/selectable_button.dart';

class CounterResult extends StatefulWidget {

  final String counterResultValue;

  const CounterResult({super.key, required this.counterResultValue});

  @override
  State<CounterResult> createState() => _CounterResultState();
}

class _CounterResultState extends State<CounterResult> {

  late final MaterialStatesController statesController;

  bool selected = false;

  void _navigate(BuildContext context) => context.goNamed('listItemView');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Counter Result',
                key: Key('COUNTER_RESULT'),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.0
                ),
              )
            ),
            SelectableButton(
              selected: selected,
              onPressed: () => _navigate(context),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.white;
                    }
                    return null; // defer to the defaults
                  },
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.indigo;
                    }
                    return null; // defer to the defaults
                  },
                ),
              ),
              child: Text(
                  widget.counterResultValue.toString(),
                  key: const Key('COUNTER_RESULT_VALUE'),
                  style: Theme.of(context).textTheme.headline4
              )
            )
          ],
        ),
      ),
    );
  }
}