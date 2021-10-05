import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/extras/constants/Constant.dart';


class LoginProvider extends ChangeNotifier with Constant{
  bool isValidValidation = false;
  String userTypeValue = txtTypeMessage;
  bool valid = false;

  String txtEmail = "";
  bool isEmailErr = true;
  String errEmailMsg = "";

  String txtPassword = "";
  bool isPasswordErr = true;
  String errPasswordMsg = "";

  void setUserType(String value) {
    userTypeValue = value;
    notifyListeners();
  }

  void checkEmail(String strEmail) {
    if (strEmail.trim().isEmpty) {
      isEmailErr = true;
      txtEmail = "";
    } else if (!isEmail(strEmail)) {
      isEmailErr = true;
      txtEmail =strEmail;
    }
    else {
      isEmailErr = false;
      txtEmail = strEmail;
    }
    checkEmailValidation();
    checkValidation();
    notifyListeners();
  }

    void checkEmailValidation() {
      if (isEmailErr) {
        if (txtEmail.trim().isEmpty) {
          errEmailMsg = 'Please Enter Email';
        }
        else
          {
            errEmailMsg = 'Please Enter valid Email';
          }
      }
    }

    void checkPassword(String strPassword) {
      if (strPassword.trim().isEmpty) {
        isPasswordErr = true;
        txtPassword = '';
      }
      // else if(!validatePassword(strPassword)){
      //   isPasswordErr = true;
      //   txtPassword = strPassword;
      // }
      else {
        isPasswordErr = false;
        txtPassword = strPassword;
      }
      checkPasswordValidation();
      checkValidation();
      notifyListeners();
    }

    void checkPasswordValidation() {
      if (isPasswordErr) {
        if (txtPassword.trim().isEmpty) {
          errPasswordMsg = "Please enter Password";
        }
        else
        {
          errPasswordMsg = 'Password must contain the following:\nA lowercase letter,A capital letter,A number,\nMinimum 8 characters,A special character';
        }
      }
    }

    void checkValidation() {
      if ((!isEmailErr) && (!isPasswordErr) && (userTypeValue!=txtTypeMessage)) {
        isValidValidation = true;
      } else {
        isValidValidation = false;
      }
    }
}
