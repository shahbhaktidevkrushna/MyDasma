import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/providers/CaregoryProvider.dart';
import 'package:my_dasma/providers/CategoryDetailProvider.dart';
import 'package:my_dasma/providers/loginProvider.dart';
import 'package:my_dasma/providers/signupProvider.dart';
import 'package:my_dasma/ui/BusinessDashboard.dart';
import 'package:my_dasma/ui/UserDashboard.dart';
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
        ChangeNotifierProvider(create: (_) =>  CategoryDetailProvider()),
        ChangeNotifierProvider(create: (_) =>  BusinessMenuProvider()),
        ChangeNotifierProvider(create: (_) =>  CategoryProvider()),



      ],child:  MyApp()),

  ));


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

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context)
        .appBarTheme
        .copyWith(brightness: Brightness.light),),

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

