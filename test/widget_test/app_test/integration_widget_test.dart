import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/login/controller/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_driver_sample/main.dart' as app;



void main() {

  late LoginController? _loginController;

  group('INTEGRATION TEST', () {

    setUp(() {
      _loginController = LoginController();
    });

    testWidgets('login authentication success test', (WidgetTester tester) async {

      /// START APP
      app.main();
      await tester.pumpAndSettle();

      // Retrieve widgets components by their key
      var usernameTextForm = find.byKey(const Key('USERNAME_FORM'));
      var passwordTextForm = find.byKey(const Key('PASSWORD_FORM'));
      var textButton       = find.byKey(const Key('TEXT_BUTTON'));

      // Check if follow widget can be found from view
      expect(usernameTextForm, findsOneWidget, reason: 'Check if USERNAME FORM exists');
      expect(passwordTextForm, findsOneWidget, reason: 'Check if PASSWORD FORM exists');
      expect(textButton, findsOneWidget, reason: 'Check if TEXT BUTTON exists');

      // Input text value
      await tester.enterText(usernameTextForm, 'YOUR_USERNAME');
      await tester.enterText(passwordTextForm, '123');

      // Retrieve username editing text controller from widget
      var usernameController = (usernameTextForm.evaluate().first.widget as TextFormField).controller;
      expect(usernameController != null && usernameController is TextEditingController, true,
          reason: 'Check if USERNAME TEXT CONTROLLER exists');

      // Retrieve password editing text controller from widget
      var passwordController = (passwordTextForm.evaluate().first.widget as TextFormField).controller;
      expect(passwordController != null && passwordController is TextEditingController, true,
          reason: 'Check if PASSWORD TEXT CONTROLLER exists');

      // Test controller login function
      await tester.runAsync(() async {
        await _loginController!.checkLogin(
            usernameController!.text, passwordController!.text, (isValid) {
          expect(isValid, true,
              reason: 'Check if login authentication was successful');
        });
      });

      var loginButton = find.byKey(const Key('TEXT_BUTTON'));
      expect(loginButton, findsOneWidget, reason: 'Check if login test button could be found');

      await tester.tap(loginButton);

      /// START HOME VIEW
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

    tearDown(() {
      _loginController = null;
    });
  });
}
