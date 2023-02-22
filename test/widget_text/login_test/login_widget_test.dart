import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver_sample/main.dart' as app;


void main() {

  group('Login TEST', () {

    testWidgets('login authentication success test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
    });
  });
}
