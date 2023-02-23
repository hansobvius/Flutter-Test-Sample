import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/login/controller/login_controller.dart';
import 'package:flutter_driver_sample/application/module/login/ui/login.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_widget_test_launcher.dart';


void main() {

  late Login? _login;
  late LoginController? _loginController;

  // Retrieve widgets components by their key
  var usernameTextForm = find.byKey(const Key('USERNAME_FORM'));
  var passwordTextForm = find.byKey(const Key('PASSWORD_FORM'));
  var textButton       = find.byKey(const Key('TEXT_BUTTON'));

  group('Login TEST', () {

    setUp(() {
      _login = const Login();
      _loginController = LoginController();
    });

    testWidgets('Check if widgets could be found', (WidgetTester tester) async {

      await tester.pumpWidget(initializeSingleView(_login!));
      await tester.pumpAndSettle();

      // Check if follow widget can be found from view
      expect(usernameTextForm, findsOneWidget, reason: 'Check if USERNAME FORM exists');
      expect(passwordTextForm, findsOneWidget, reason: 'Check if PASSWORD FORM exists');
      expect(textButton, findsOneWidget, reason: 'Check if TEXT BUTTON exists');
    });

    testWidgets('Login authentication success test', (WidgetTester tester) async {

      await tester.pumpWidget(initializeSingleView(_login!));
      await tester.pumpAndSettle();

      // Inout text value
      await tester.enterText(usernameTextForm, 'Thiago');
      await tester.enterText(passwordTextForm, '123');

      // Retrieve username editing text controller from widget
      var usernameController = (usernameTextForm.evaluate().first.widget as TextFormField).controller;
      expect(usernameController != null && usernameController is TextEditingController, true,
          reason: 'Check if USERNAME TEXT CONTROLLER exists');

      // Retrieve password editing text controller from widget
      var passwordController = (passwordTextForm.evaluate().first.widget as TextFormField).controller;
      expect(passwordController != null && passwordController is TextEditingController, true,
          reason: 'Check if PASSWORD TEXT CONTROLLER exists');

      if (usernameController != null && passwordController != null) {
        await tester.runAsync(() async {
          await _loginController!.checkLogin(
              usernameController.text, passwordController.text, (isValid) {
            expect(isValid, true,
                reason: 'Check if login authentication was successful');
          });
        });
      }
    });

    tearDown(() {
      _login = null;
      _loginController = null;
    });
  });
}
