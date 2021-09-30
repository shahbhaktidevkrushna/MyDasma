import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_dasma/extras/commonWidgets/CommonErrorText.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/extras/constants/SharePrefConstant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/model/LoginModel.dart';
import 'package:my_dasma/providers/loginProvider.dart';
import 'package:my_dasma/ui/BusinessDashboard.dart';
import 'package:my_dasma/ui/ForgotPasswordScreen.dart';
import 'package:my_dasma/ui/UserDashboard.dart';
import 'package:my_dasma/ui/SignupScreen.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import '../webservice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Constant {
  final _username = TextEditingController();
  final _passController = TextEditingController();

  // String _dropDownValue = txtTypeMessage;
  bool _validate = false;
  int _value = 1;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  late LoginProvider loginProviderRead;
  late LoginProvider loginProviderWatch;
  final storage = GetStorage();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      loginProviderRead = context.read<LoginProvider>();
      emailFocus.addListener(() {
        loginProviderWatch.checkEmail(_emailController.text);
      });
      passwordFocus.addListener(() {
        loginProviderWatch.checkPassword(_passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginProviderWatch = context.watch<LoginProvider>();
    print("build is called");
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xff6E0CDB),
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: 150.h,
                width: 170.h,
                margin: EdgeInsets.only(top: 50.h, bottom: 40.h),
                decoration: BoxDecoration(
                    // color: Colors.white,

                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(appLogo),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    /*GestureDetector(
                        onTap : (){
                          CustomDropDownBtn();
                        },
                        child: getTextWidget("Select User: ")),*/

                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 38.h,
                      padding: EdgeInsets.only(
                          top: 4.h, left: 16.w, right: 16.w, bottom: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5.r)
                          ]),
                      child: DropdownButton(
                        hint: loginProviderWatch.userTypeValue == null
                            ? Text('Dropdown')
                            : Text(
                                "" +
                                    loginProviderWatch.userTypeValue.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                        isExpanded: true,
                        iconSize: 30.0.r,
                        underline: Container(),
                        style: TextStyle(color: Colors.black),
                        items: [txtUser, txtBusiness].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          loginProviderWatch.setUserType(val.toString());
                        },
                      ),
                    ),

                    SizedBox(height: 26.h),
                    CommonEditTextWidget(
                      context: context,
                      lableText: txtEmail,
                      focuNode: emailFocus,
                      txtController: _emailController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      obsecureText: false,
                      onChanged: (value) {
                        print("controller value::" + value);
                        loginProviderWatch.checkEmail(_emailController.text);
                      },
                    ),
                    CommonErrorText(context:context ,errMsg: loginProviderWatch.errEmailMsg,visible:loginProviderWatch.isEmailErr ,),

                    SizedBox(height: 6.h),

                    CommonEditTextWidget(
                      context: context,
                      lableText: txtPassword,
                      focuNode: passwordFocus,
                      txtController: _passwordController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obsecureText: true,
                      onChanged: (value) {
                        loginProviderWatch.checkPassword(_passwordController.text);
                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left:32.h,top: 4.h),
                      child: Container(
                          height: 42.h,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child:loginProviderWatch.isPasswordErr
                                ? Text(
                              loginProviderWatch.errPasswordMsg,
                              style: TextStyle(color: Colors.red),
                            )
                                : Container(),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                          },
                          child: Text(
                            txtForGotPassword,
                            style: TextStyle(color: colorPurple),
                          ),
                        ),
                      ),
                    ),
                    //Spacer(),

                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                        height: 38.h,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: loginProviderWatch.isValidValidation
                            ? ElevatedButton(
                                onPressed: () {

                                  fetchHomeApi();
                                  Future.delayed(Duration.zero, () {
                                    getProgress(context);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: colorPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 15.0.r,
                                ),
                                child: Text(
                                  txtSignIn,
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {

                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 15.0.r,
                                ),
                                child: Text(
                                  txtSignIn,
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                              )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text("Don't have an account ?", style: TextStyle(color: Colors.white)),
                    Text(txtDontHaveAccount,
                        style: TextStyle(color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Text(
                        txtSignUp,
                        // style: TextStyle(color: Colors.white),
                        style: TextStyle(color: colorPurple),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Navigator.pushNamed(context, '/signUp');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
              ),
            ],
          )),
        ),
      ),
    );
  }

  fetchHomeApi() async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["email"] = _emailController.text;
    map["password"] = _passwordController.text;

    Webservice().loadPost(getHomeNews, map).then(
          (model) => {
            print("id is::" + model.data!.id.toString()),
            if (model.status == true)
              {
                storage.write(userData, model),
                storage.write(isLogin, true),
                storage.write(loginType, loginProviderWatch.userTypeValue),
                if (storage.read(loginType) == "User")
                  {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDashboardScreen()))
                  }
                else
                  {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusinessDashboard()))
                  }
              }
            else
              {storage.write(isLogin, false)}
          },
        );
  }

  Resource<LoginModel> get getHomeNews {
    return Resource(
        url: loginProviderWatch.userTypeValue == "User"
            ? "https://www.mydasma.com/mydasma_api/api/user/user_login"
            : "https://www.mydasma.com/mydasma_api/api/user/business_login",
        parse: (response) {
          Navigator.pop(context);
          final result = json.decode(response.body);
          print("" + ".......getSupplierLogin......." + result.toString());
          bool success = result["status"];
          if (success) {
            return loginModelFromJson(response.body);
          } else {
            String message = result["message"];
            showSnackBar(context, message);
            return loginModelFromJson(response.body);
          }
          return result;
        });
  }
}
