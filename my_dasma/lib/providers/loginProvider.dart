import 'package:flutter/cupertino.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class LoginProvider extends ChangeNotifier{

  String userTypeValue=txtTypeMessage;

  void setUserType(String value) {
    userTypeValue = value;
    notifyListeners();
  }






}