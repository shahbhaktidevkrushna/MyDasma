import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/commonWidgets/btnWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with Constant {

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: "Forgot Password",
          isLeading: true,

        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100.h),
              height: 80.h,
              width: 80.h,
              child: Image.asset(forgotPassword),
            ),
            SizedBox(height: 30.h,),
           Text(txtForGotPassword,style: TextStyle(color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.bold),),
            SizedBox(height: 5.h,),
            Text(txtForgotMsg,
              maxLines: 2,
              style: TextStyle(color: Colors.grey,fontSize: 12.sp,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            Center(
             child: CommonEditTextWidget(
                 context: context, txtController: _emailController, lableText: txtEmail, textInputType: TextInputType.emailAddress),
           ),

            SizedBox(height: 20.h,),



            Container(
                // margin: EdgeInsets.only(top: 32.0.h),
                child: BtnWidget(() {
                  if (_emailController.text.isEmpty){
                    showSnackBar(context, errEmptyEmail);
                    return;
                  } else if (!isEmail(_emailController.text)){
                    showSnackBar(context, errNotValidEmail);
                    return;
                  } else {
                    showSnackBar(context, "Successfully email submit");
                  }
                }, btnText: txtSubmit))
          ],
        )
      ),
    );
  }




}
