import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/login/controller/login_controller.dart';
import 'package:flutter_driver_sample/application/module/login/ui/login.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_widget_test_launcher.dart';


void main() {

  late Login _login;
  late LoginController? _loginController;

  group('Login TEST', () {

    setUp(() {
      _login = const Login();
      _loginController = LoginController();
    });

    testWidgets('login authentication success test', (WidgetTester tester) async {

      await tester.pumpWidget(initializeSingleView(_login));
      await tester.pumpAndSettle();

      var usernameTextForm = find.byKey(const Key('USERNAME_FORM'));
      var passwordTextForm = find.byKey(const Key('PASSWORD_FORM'));
      var textButton = find.byKey(const Key('TEXT_BUTTON'));

      // Check if follow widget can be found from view
      expect(usernameTextForm, findsOneWidget, reason: 'Check if USERNAME FORM exists');
      expect(passwordTextForm, findsOneWidget, reason: 'Check if PASSWORD FORM exists');
      expect(textButton, findsOneWidget, reason: 'Check if TEXT BUTTON exists');

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
    });

    tearDown(() {
      _loginController = null;
    });
  });
}
