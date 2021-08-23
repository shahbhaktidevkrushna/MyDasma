import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnWidget extends StatelessWidget {

  final String btnText;
  final Function()? onTap;

  BtnWidget(this.onTap, {Key? key, required this.btnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: MediaQuery.of(context).size.width/1.2,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: Color(0xff6E0CDB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          elevation: 15.0,
        ),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }
}
