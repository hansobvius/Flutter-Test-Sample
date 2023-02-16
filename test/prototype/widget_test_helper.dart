/// CREATE AT: 27/02/21

// import 'dart:io';
// import 'package:atena_saas_v2/resources/localization/localizations_delegate.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:atena_saas_v2/app/ui/shared/filter_component.dart';
//
//
// main() => runApp(MockedApp(
//     child: FilterComponent(
//         itemCount: 0,
//         child: Center(
//             child: Text('')
//         )
//     )
// ));
//
// Widget _createWidget(Widget widget){
//   return MaterialApp(
//       supportedLocales: [Locale('pt', '')],
//       localizationsDelegates: [
//         AppLocalizationsDelegate(),
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       locale: Locale('pt'),
//       home: Scaffold(
//           body: widget
//       )
//   );
// }
//
// class MockedApp extends StatelessWidget{
//
//   static const platform = const MethodChannel("native_channel");
//   static const METHOD_CHANNEL = "flag";
//   final Widget child;
//
//   MockedApp({@required this.child});
//
//   void sendMessage(bool value) async {
//     if(Platform.isAndroid){
//       try{
//         await platform.invokeMethod(METHOD_CHANNEL, {
//           "msg": "true"
//         });
//       }on PlatformException catch (e) {
//         print("Android Platform Exception: ${e.message}");
//       }
//     } else if(Platform.isIOS){
//       try{
//         await platform.invokeMethod(METHOD_CHANNEL, {
//           "msg": "true"
//         });
//       }on PlatformException catch (e) {
//         print("iOS Platform Exception: ${e.message}");
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context){
//     sendMessage(true);
//     return _createWidget(
//         _createWidget(child)
//     );
//   }
// }