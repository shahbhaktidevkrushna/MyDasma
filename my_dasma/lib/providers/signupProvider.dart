import 'package:flutter/cupertino.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class SignupProvider extends ChangeNotifier{

  DateTime selectedDate = DateTime.now();
  var tabIndex = 0;
  String country="";
  String state="";
  var strNoFileChose = "No File chosen";

  void setSelecteDate(DateTime value) {
    selectedDate = value;
    notifyListeners();
  }

  void setTabIndex(int index)
  {
    tabIndex=index;
    notifyListeners();
  }
  void setCountry(String value) {
    country = value;
    notifyListeners();
  }

  void setStateViseCountry(String value) {
    state = value;
    notifyListeners();
  }

  void setFile(String value) {
    strNoFileChose = value;
    notifyListeners();
  }


}