import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_driver_sample/main.dart' as app;

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('INTEGRATION TEST', () {

    testWidgets('failing test example', (tester) async {

      app.main();
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      for(int c = 10; c >= 0; c--) {
        await tester.tap(fab);
      }

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('11'), findsOneWidget);
    });

  });
}