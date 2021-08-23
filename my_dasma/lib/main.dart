import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/providers/loginProvider.dart';
import 'package:my_dasma/providers/signupProvider.dart';

import 'package:my_dasma/ui/splashScreen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) =>  LoginProvider()),
    ChangeNotifierProvider(create: (_) =>  SignupProvider())
  ],child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => MaterialApp(
        title: "SplashScreen",
        home: SplashScreen(),
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
}

