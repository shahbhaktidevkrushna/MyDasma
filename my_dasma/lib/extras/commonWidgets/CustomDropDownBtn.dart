import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/providers/loginProvider.dart';
import 'package:my_dasma/providers/signupProvider.dart';

class CustomDropDownBtn extends StatefulWidget {
  SignupProvider? signupProvider;
  LoginProvider? loginProvider;


  CustomDropDownBtn({Key? key, this.signupProvider, this.loginProvider}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  _CustomDropDownBtnState createState() => _CustomDropDownBtnState();
}

class ListItem{
  int value;
  String name;
  ListItem(this.value, this.name);
}

class _CustomDropDownBtnState extends State<CustomDropDownBtn> {

  String dropdownValue = 'One';
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24.r,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2.h,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


