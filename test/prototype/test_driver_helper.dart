// import 'dart:io';
// import 'package:atena_saas_v2/app/application_module.dart';
// import 'package:atena_saas_v2/app/networking/services/login_service.dart';
// import 'package:atena_saas_v2/app/networking/services/training_detail_service.dart';
// import 'package:atena_saas_v2/app/ui/modules/login/login_module.dart';
// import 'package:atena_saas_v2/app/ui/modules/media/media_module.dart';
// import 'package:atena_saas_v2/app/ui/modules/profile/screens/certificate_view/certificate_list/my_certificates_list_view.dart';
// import 'package:atena_saas_v2/app/ui/modules/profile/screens/edit_profile_view/edit_profile_view.dart';
// import 'package:atena_saas_v2/app/ui/shared/app_image_svg.dart';
// import 'package:atena_saas_v2/app/ui/shared/app_text_default.dart';
// import 'package:atena_saas_v2/app/ui/shared/app_view_no_connection.dart';
// import 'package:atena_saas_v2/app/ui/widgets_app/global_scaffold.dart';
// import 'package:atena_saas_v2/resources/colors/app_colors.dart';
// import 'package:atena_saas_v2/resources/constants/constants.dart';
// import 'package:atena_saas_v2/resources/localization/language/languages.dart';
// import 'package:atena_saas_v2/resources/localization/localizations_delegate.dart';
// import 'package:atena_saas_v2/resources/utils/app_notification.dart';
// import 'package:audio_service/audio_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_modular/flutter_modular_test.dart';
// import 'package:get_it/get_it.dart';
//
// import 'media/multi_media_component_test.dart';
// import 'sso_login/login_sso_view_test.dart';
//
// main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize();
//
//   // PushNotificationService.instance.initialise();
//   initModule(AppModule());
//   initModule(MediaModule());
//   runApp(
//     TestDrive(
//       child: MultiMediaFilterComponent(
//           itemCount: 10,
//           child: Center(
//             child: Text(
//               "MEDIA FILTER COMPONENT TEST",
//               style: TextStyle(
//                   fontSize: 22
//               ),
//             ),
//           )
//       ),
//     ),
//   );
// }
//
// Widget createWidget(Widget widget) {
//   final primaryColor = Color(0xff00ACB6);
//
//   final MaterialColor colorCustom = MaterialColor(
//     primaryColor.value,
//     {
//       50: primaryColor.withOpacity(.1),
//       100: primaryColor.withOpacity(.2),
//       200: primaryColor.withOpacity(.3),
//       300: primaryColor.withOpacity(.4),
//       400: primaryColor.withOpacity(.5),
//       500: primaryColor.withOpacity(.6),
//       600: primaryColor.withOpacity(.7),
//       700: primaryColor.withOpacity(.8),
//       800: primaryColor.withOpacity(.9),
//       900: primaryColor.withOpacity(1),
//     },
//   );
//
//   return MaterialApp(
//     supportedLocales: [
//       Locale('pt', ''),
//     ],
//     localizationsDelegates: [
//       AppLocalizationsDelegate(),
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ],
//     theme: ThemeData(
//       primarySwatch: colorCustom,
//       accentColor: colorCustom.shade900,
//     ),
//     locale: Locale('pt'),
//     home: Scaffold(
//       backgroundColor: Colors.greenAccent,
//       key: GlobalScaffold.instance.scaffoldkey,
//       body: AudioServiceWidget(
//         child: widget,
//       ),
//     ),
//   );
// }
//
// class TestDrive extends StatelessWidget {
//   static const platform = const MethodChannel("native_channel");
//   static const METHOD_CHANNEL = "flag";
//   final Widget child;
//
//   TestDrive({@required this.child});
//
//   void sendMessage() async {
//     if (Platform.isAndroid) {
//       try {
//         await platform.invokeMethod(METHOD_CHANNEL, {"msg": "true"});
//       } on PlatformException catch (e) {
//         print("Android Platform Exception: ${e.message}");
//       }
//     } else if (Platform.isIOS) {
//       try {
//         await platform.invokeMethod(METHOD_CHANNEL, {"msg": "true"});
//       } on PlatformException catch (e) {
//         print("iOS Platform Exception: ${e.message}");
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // sendMessage();
//     return createWidget(child);
//   }
// }
