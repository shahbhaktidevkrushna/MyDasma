import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/ui/SigninScreen.dart';
import 'package:my_dasma/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), 
        () => Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => HomeScreen()          )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: /*Text("MyDasma",
          style: TextStyle(fontSize: 48),),*/
        Image.asset('assets/logo_my_dasma.png')
      ),
    );
  }
}
