import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text("Welcome"),),
      body: Container(
        child: Center(
          child: Text("Coming soon", style: TextStyle(
              color: Color(0xff6E0CDB), fontSize: 32.0.sp, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
