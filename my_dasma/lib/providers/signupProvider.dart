import 'package:flutter/cupertino.dart';
import 'package:my_dasma/City.dart';
import 'package:my_dasma/Country.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class SignupProvider extends ChangeNotifier{

  DateTime selectedDate = DateTime.now();
  var tabIndex = 0;
  String country="";
  String businessType = "Select type of business";
  String businesscountry="";
  String selectedCityUser="Select your city";
  String selectedCityBusiness="Select your city";

  String state="Select your city";
  String businessState="";
  var strNoFileChose = "No File chosen";
  late Country cc;
  late City cityObject;

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

  void setBusinessType(String value){
    businessType = value;
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

  void setBusinessCountry(String value) {
    businesscountry = value;
    notifyListeners();
  }

  void setBusinessState(String value) {
    businessState = value;
    notifyListeners();
  }

  void setCountryObject(Country value) {
    cc = value;
    notifyListeners();
  }

  void setCityObject(City value) {
    cityObject = value;
    notifyListeners();
  }

  void setCityHint(String value) {
    selectedCityUser = value;
    notifyListeners();
  }

  void setBusinessCityHint(String value) {
    selectedCityBusiness = value;
    notifyListeners();
  }
}
