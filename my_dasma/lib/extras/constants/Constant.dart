import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constant
{

  // snackBar
  showSnackBar(BuildContext context, String message) {
    // ScaffoldMessenger(key: ,).of(context).showSnackBar(SnackBar(content: Text(message)));
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Progeress Bar
  Future getProgress(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 60.0.w,
          height: 60.0.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }

  //Email Validation
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  // Password validation
  bool validatePassword(String value) {
    /*Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';*/

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$';
    RegExp regex = new RegExp(pattern);
    // print(value);

    return regex.hasMatch(pattern);
  }

  // Phone number validation
  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }

}