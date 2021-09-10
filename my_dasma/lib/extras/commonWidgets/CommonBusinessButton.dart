import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonElevatedButton extends StatelessWidget
{
   BuildContext context;
   String lableText;
   Color? ButtonBackground;
   final Function()? onTap;


   CommonElevatedButton({
    required this.context,
     this.onTap,
    required this.lableText,
     this.ButtonBackground,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      child: ElevatedButton(

        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // primary: Colors.white,
          primary: ButtonBackground != null ? ButtonBackground:Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5.0.r,
        ),
        child: Text(
          lableText,
          // style: TextStyle(fontSize: 20.sp,color: Color(0xff6E0CDB)),
          style: TextStyle(fontSize: 14.sp,color: Colors.white),
        ),
      ),
    );
  }

}