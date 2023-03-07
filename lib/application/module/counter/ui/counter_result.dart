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
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Press for a long time the button below',
                key: Key('COUNTER_RESULT'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.0
                ),
              )
            ),
            SelectableButton(
              key: const Key('SELECTABLE_BUTTON_KEY'),
              selected: selected,
              onPressed: () => _navigate(context),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.black12;
                    }
                    return Colors.black12;// defer to the defaults
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