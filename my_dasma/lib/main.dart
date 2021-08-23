import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/providers/loginProvider.dart';
import 'package:my_dasma/providers/signupProvider.dart';
import 'package:my_dasma/ui/home_screen.dart';

import 'package:my_dasma/ui/splashScreen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    path: 'assets/langs',
    supportedLocales: MyApp.list,
    saveLocale: true,
    useOnlyLangCode: true,
    child: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) =>  LoginProvider()),
        ChangeNotifierProvider(create: (_) =>  SignupProvider()),
        ChangeNotifierProvider(create: (_) =>  MenuProvider()),
      ],child:  MyApp()),

  ));

  // MultiProvider(providers: [
  //   ChangeNotifierProvider(create: (_) =>  LoginProvider()),
  //   ChangeNotifierProvider(create: (_) =>  SignupProvider()),
  // ],child:  MyApp())
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const list = [
    Locale('en'),
    Locale('ar'),
  ];


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => MaterialApp(
        title: "SplashScreen",
       home: SplashScreen(),
        // home: ChangeNotifierProvider(
        //   create: (_) => MenuProvider(),
        //   child: HomeScreen(),
        // ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          //primarySwatch: MaterialColor(0xff6E0CDB, { 500: Color(0xff6E0CDB)}),
         // primaryColor: Color(0xff6E0CDB)
          //primarySwatch: Color(0xff6E0CDB)
          //primarySwatch: Colors.lightBlue,
            primarySwatch: Colors.deepPurple
        ),
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Container(child: widget),
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  /// Languages that are Right to Left
  static List<String> RTL_LANGUAGES = ["ar", "ur", "he", "dv", "fa"];

  /// Static function to determine the device text direction RTL/LTR
  static bool isRTL() {
    /// Device language
    final locale = _getLanguageCode();

    return RTL_LANGUAGES.contains(locale);
  }

  static String? _getLanguageCode() {
    try {
      return ui.window.locale.languageCode.toLowerCase();
    } catch (e) {
      return null;
    }
  }
}

