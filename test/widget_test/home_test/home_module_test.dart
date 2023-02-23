import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/home/ui/home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_widget_test_launcher.dart';
import 'home_module_router.dart';


void main() {

  group('HOME TEST', () {

    testWidgets('counter increments smoke test', (WidgetTester tester) async {

      // Build our app and trigger a frame.
      await tester.pumpWidget(initializeSingleView(const Home(title: 'home')));

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

      // Initialize
      await tester.pumpWidget(initializeSingleView(const Home(title: 'home')));
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

      // Initialize
      await tester.pumpWidget(initializeSingleRouterView(homeModuleRouter));
      await tester.pumpAndSettle();

      // Find floating button by key
      final Finder fab = find.byKey(const Key('FLOATING_BUTTON_INCREMENT'));
      expect(fab, findsOneWidget,
          reason: 'Check if exist a floating button widget with declared key');

      // Increment until matches 11 value
      for(int c = 0; c <= 10; c++) {
        await tester.tap(fab);
      }

      // Trigger a frame.
      await tester.pumpAndSettle();

      // check if a particular widget could be fond on screen
      final Finder textWidgetData = find.byKey(const Key('COUNTER_RESULT'));
      expect(textWidgetData, findsOneWidget,
          reason: 'Check if exist a text widget with declared key');

      // Check current value of Text Widget data
      var textWidget = textWidgetData.evaluate().first.widget as Text;
      var textWidgetCurrentValue = textWidget.data;
      expect(
          textWidgetCurrentValue != null
              && textWidgetCurrentValue != ''
              && textWidgetCurrentValue == '11',
          true,
          reason: 'Check if value matches 11 by retrieve the widget by its key');
    });
  });
}
