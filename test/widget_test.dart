import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/app.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_driver_sample/main.dart' as app;



void main() {

  group('INTEGRATION TEST', () {

    testWidgets('counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const App());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('first view text', (tester) async {

      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('second view test', (tester) async {

      app.main();
      await tester.pumpAndSettle();

      final Finder fab = find.byKey(const Key('FLOATING_BUTTON_INCREMENT'));

      for(int c = 10; c >= 0; c--) {
        await tester.tap(fab);
      }

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('11'), findsOneWidget);

      /// check if a particular widget could be fond on screen
      var textWidgetData = find.byKey(const Key('COUNTER_RESULT'));
      expect(textWidgetData, findsOneWidget);

      var textWidget = textWidgetData.evaluate().first.widget as Text;
      var textWidgetCurrentValue = textWidget.data;
      expect(
          textWidgetCurrentValue != null
              && textWidgetCurrentValue != ''
              && textWidgetCurrentValue == '11',
          true);
    });

  });
}
