import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/UserData.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/providers/loginProvider.dart';
import 'package:my_dasma/ui/WelcomePage.dart';
import 'package:my_dasma/ui/forgotPasswordPage.dart';
import 'package:my_dasma/ui/home_screen.dart';
import 'package:my_dasma/ui/menu_page.dart';
import 'package:my_dasma/ui/signupScreen.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import '../webservice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

//#http: ^0.12.0+4

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Constant{
  final _username = TextEditingController();
  final _passController = TextEditingController();
  // String _dropDownValue = txtTypeMessage;
  bool _validate = false;
  int _value = 1;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late LoginProvider loginProviderRead;
  late LoginProvider loginProviderWatch;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      loginProviderRead=context.read<LoginProvider>();
      loginProviderRead.userTypeValue=txtTypeMessage;

    });
  }

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginProviderWatch=context.watch<LoginProvider>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xff6E0CDB),
        backgroundColor:Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150.h,
                  width: 170.h,
                  margin: EdgeInsets.only(top: 50.h,bottom: 40.h),
                  decoration: BoxDecoration(
                    // color: Colors.white,

                      borderRadius: BorderRadius.circular(20)
                  ),
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
                              : Text(""+loginProviderWatch.userTypeValue.toString(),
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
                            // setState(
                            //       () {
                            //     _dropDownValue = val.toString();
                            //   },
                            // );
                          },
                        ),
                      ),

                      SizedBox(height: 15.h),
                      CommonEditTextWidget(
                        context: context,
                        lableText:txtEmail ,
                        txtController: _emailController,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,


                      ),
                      // getFieldWidget("Email ID", _emailController,
                      //     type: TextInputType.emailAddress),

                      SizedBox(height:15.h),

                      CommonEditTextWidget(
                        context: context,
                        lableText:txtPassword ,
                        txtController: _passwordController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        obsecureText: true,

                      ),

                      SizedBox(height:10.h),
                      // getFieldWidget('Password', _passwordController,
                      //     obscureTxtBoolean: true),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 32.w),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()));
                            },
                            child: Text(
                              txtForGotPassword,
                              // style: TextStyle(color: Colors.white),
                              style: TextStyle(color: colorPurple),
                            ),
                          ),
                        ),
                      ),
                      //Spacer(),

                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 38.h,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: ElevatedButton(
                          onPressed: () {
                            //loginValidationFor();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));

                            showSnackBar(context, "clicked");

                            /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditProfilePage()));*/
                          },
                          style: ElevatedButton.styleFrom(
                            // primary: Colors.white,
                            primary: colorPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 15.0.r,
                          ),
                          child: Text(
                            txtSignIn,
                            // style: TextStyle(fontSize: 20.sp,color: Color(0xff6E0CDB)),
                            style: TextStyle(fontSize: 20.sp,color: Colors.white),
                          ),
                        ),
                      )
                      /* BtnWidget((){
      */ /*if (_emailController.text.isEmpty){
                        showSnackBar(context, "Email is empty");
                        return;
                      } else if (!isEmail(_emailController.text)){
                        showSnackBar(context, "Email is not valid");
                        return;
                      } else if (_passwordController.text.isEmpty){
                        showSnackBar(context, "Password is empty");
                        return;
                      } else if (!validatePassword(_passwordController.text)){
                        showSnackBar(context, "Password is not valid");
                        return;
                      } else if (isEmail(_emailController.text) && validatePassword(_passwordController.text)){
                        showSnackBar(context, "Valid email password");
                        return;
                      }*/ /*



      }, btnText: 'Login'),*/
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
                      Text(txtDontHaveAccount, style: TextStyle(color: Colors.black)),
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
            )


          ),
        ),
      ),
    );
  }



  loginValidationFor() {
    if (_emailController.text.isEmpty) {
      showSnackBar(context, errEmptyEmail);
      return;
    } else if (!isEmail(_emailController.text)) {
      showSnackBar(context, errNotValidEmail);
      return;
    } else if (_passwordController.text.isEmpty) {
      showSnackBar(context, errEmptyPassword);
      return;
    } else if (loginProviderWatch.userTypeValue == "Select user type") {
      showSnackBar(context, errSelectUserType);
      return;
    }
    /*else if (!validatePassword(_passController.text)){
      showSnackBar(context, "Password is not valid");
      return;
    }*/
    else {
      fetchHomeApi();
      Future.delayed(Duration.zero, () {
        getProgress(context);
      });
    }
  }


  fetchHomeApi() async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["email"] = _emailController.text;
    map["password"] = _passwordController.text;

    Webservice().loadPost(getHomeNews, map).then(
          (model) => {},
        );
  }

  Resource<User> get getHomeNews {
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => WelcomePage()));
          } else {
            String message = result["message"];
            showSnackBar(context, message);
          }
          return result;
        });
  }
}
