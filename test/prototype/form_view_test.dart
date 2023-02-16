/// CREATED: 26/02/21
/// another reference was fond in the follow 02/02/21

// import 'package:atena_saas_v2/app/controllers/login_controller/login_controller.dart';
// import 'package:atena_saas_v2/app/networking/services/login_service.dart';
// import 'package:atena_saas_v2/app/ui/modules/login/screens/user_register_view/components/user_register_form.dart';
// import 'package:atena_saas_v2/app/ui/modules/login/screens/user_register_view/user_register_view.dart';
// import 'package:atena_saas_v2/resources/localization/localizations_delegate.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_it/get_it.dart';
// import '../../login_module_helper.dart';
//
//
// Widget createWidgetTest(Widget widget){
//   return MaterialApp(
//       supportedLocales: [Locale('pt', '')],
//       localizationsDelegates: [
//         AppLocalizationsDelegate(),
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       home: widget
//   );
// }
// void main() async{
//
//   LoginController;
//   UserRegisterView _userRegisterWidget;
//   String nameControllerValue;
//   String emailControllerValue;
//   String passwordControllerValue;
//
//   GetIt.I.registerSingleton<LoginService>(LoginService());
//
//   group("USER REGISTER WIDGET TEST", (){
//
//     setUp((){
//       _userRegisterWidget = UserRegisterView();
//
//       LoginModuleHelper().load(changeBinds: [
//         Bind<LoginController>((i) => _loginTestController)
//       ]);
//
//       _loginTestController = Modular.get<LoginController>();
//     });
//
//     test("INIT LOGIN MODULAR HELPER", (){
//       LoginModuleHelper().load();
//     });
//
//     testWidgets("USER REGISTER WIDGET BUILD", (tester) async =>
//     await tester.pumpWidget(createWidgetTest(_userRegisterWidget)));
//
//     testWidgets("TEST SUCCESSFUL USER REGISTER", (tester) async {
//       await tester.pumpWidget(createWidgetTest(_userRegisterWidget));
//       await tester.pumpAndSettle();
//
//       var topLevelWidget = find.byKey(Key("user_register_login"));
//       var userRegisterFormKey = find.byKey(Key("user_register_form_key"));
//       var editNameField = find.byKey(Key("user_name"));
//       var editEmailField = find.byKey(Key("user_email"));
//       var editPasswordField = find.byKey(Key("user_password"));
//       var submitFormButton = find.byKey(Key("user_register_submit"));
//
//       /// CHECK FOR SUCCEED WIDGET BUILT
//       expect(topLevelWidget, findsOneWidget);
//       expect(userRegisterFormKey, findsOneWidget);
//       expect(editNameField, findsOneWidget);
//       expect(editEmailField, findsOneWidget);
//       expect(editPasswordField, findsOneWidget);
//       expect(submitFormButton, findsOneWidget);
//
//       /// INPUT VALUE ON WIDGET FORM´S
//       await tester.enterText(editNameField, "name");
//       await tester.enterText(editEmailField, "email@uolinc.com");
//       await tester.enterText(editPasswordField, "1234");
//
//       /// RETRIEVE FORM KEY VALUE FROM TOP LEVEL WIDGET
//       var topLeveLFormWidget = (userRegisterFormKey.evaluate().last.widget) as Expanded;
//       var child = topLeveLFormWidget.child as UserRegisterForm;
//       var formValue = child.formKey as GlobalKey<FormState>;
//
//       /// RETRIEVE TEXT FIELD CONTROLLER VALUES
//       var nameController = (editNameField.evaluate().last.widget) as TextFormField;
//       nameControllerValue = nameController.controller.value.text;
//
//       var emailController = (editEmailField.evaluate().last.widget) as TextFormField;
//       emailControllerValue = emailController.controller.value.text;
//
//       var passworController = (editPasswordField.evaluate().last.widget) as TextFormField;
//       passwordControllerValue = passworController.controller.value.text;
//
//       /// RETRIEVE SUBMIT BUTTON
//       await tester.press(submitFormButton);
//
//       /// TEST RETURN FIELD VALUE
//       expect(nameControllerValue, "name");
//       expect(emailControllerValue, "email@uolinc.com");
//       expect(passwordControllerValue, "1234");
//
//       /// TEST FORM VALIDATION
//       expect(formValue.currentState.validate(), true);
//     });
//
//     test('TEST VIEW CONTROLLER', () async {
//       var result = await _loginTestController.submit(
//           emailControllerValue,
//           emailControllerValue,
//           passwordControllerValue
//       );
//       expect(404, result);
//     });
//
//     tearDown((){
//       _userRegisterWidget = null;
//       _loginTestController = null;
//     });
//   });
// }
