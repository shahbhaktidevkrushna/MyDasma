import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonErrorText extends StatelessWidget
{
   BuildContext context;
   String errMsg;
   bool visible;



   CommonErrorText({
    required this.context,
    required this.errMsg,
    required this.visible
    });

  @override
  Widget build(BuildContext context) {

    return Container(
      child:  Padding(
        padding:  EdgeInsets.only(left:32.h,top: 4.h),
        child: Container(
            height: 16.h,
            child: Align(
              alignment: Alignment.topLeft,
              child:visible
                  ? Text(
                errMsg,
                style: TextStyle(color: Colors.red),
              )
                  : Container(),
            )),
      ),
    );
  }

}