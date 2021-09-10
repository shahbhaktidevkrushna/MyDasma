import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBusinessTextField extends StatelessWidget
{
   BuildContext context;
   String hintText;
   int maxLine;
   final Function()? onTap;


   CommonBusinessTextField({
    required this.context,
     required this.hintText,
     required this.maxLine,
     this.onTap,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      child: TextField(
        style: TextStyle(
            fontSize: 14.sp,

            color: Colors.black
        ),
        maxLines: maxLine,
        decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            hintText: hintText,
            isDense: true,

            hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.normal)
        ),
      ),
    );
  }

}