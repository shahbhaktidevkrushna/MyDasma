import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonEditTextWidget extends StatelessWidget
{
   BuildContext context;
   TextEditingController? txtController;
  String lableText;
   FocusNode? focuNode;
  TextInputType textInputType;
  TextInputAction? textInputAction;
  ValueChanged<String>? onChanged;
  bool obsecureText;
  bool enabled;

  CommonEditTextWidget({
    required this.context,
    required this.txtController,
    this.focuNode,
    required this.lableText,
    // required this.focuNode,
    required this.textInputType,
    this.textInputAction,
    this.onChanged,
    this.obsecureText=false,
    this.enabled=true
    });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 38.h,
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.r)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)]),
      child: TextFormField(
        controller: txtController,
         focusNode: focuNode,
        onChanged: onChanged,
        obscureText: obsecureText,
        enabled: enabled,
        keyboardType: textInputType,
        textInputAction: textInputAction,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: lableText,
              hintStyle: TextStyle(color: Colors.grey))
      ),
    );
  }

}