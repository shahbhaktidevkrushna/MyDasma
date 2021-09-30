import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_dasma/extras/constants/SharePrefConstant.dart';
import 'package:my_dasma/ui/BusinessDashboard.dart';

import 'package:my_dasma/ui/SigninScreen.dart';
import 'package:my_dasma/ui/UserDashboard.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final storage = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Timer(Duration(seconds: 3), 
        () {

      // if(storage.read(isLogin) != null && storage.read(isLogin)) {
      //   if(storage.read(loginType)=="User")
      //     {
      //       Navigator.pushReplacement(context,
      //           MaterialPageRoute(builder: (context) => UserDashboardScreen()));
      //     }
      //   else{
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => BusinessDashboard()));
      //   }
      //
      // }
      //
      //
      // else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginPage()));

      // }
  });
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
