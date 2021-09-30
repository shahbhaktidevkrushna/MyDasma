import 'package:flutter/cupertino.dart';
import 'package:my_dasma/City.dart';
import 'package:my_dasma/Country.dart';
import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class SignupProvider extends ChangeNotifier with Constant{

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


  bool isValidValidation = false;

  String txtName = "";
  bool isNameErr = true;
  String errNameMsg = "";

  void checkName(String strName) {
    if (strName.trim().isEmpty) {
      isNameErr = true;
      txtName = "";
    }
    else {
      isNameErr = false;
      txtName = strName;
    }
    checkNameValidation();
    notifyListeners();
  }
  void checkNameValidation() {
    if (isNameErr) {
      if (txtName.trim().isEmpty) {
        errNameMsg = 'Please Enter Name';
      }
      else
      {
        errNameMsg = 'Please Enter valid Name';
      }
    }
  }


  String txtSurName = "";
  bool isSurNameErr = true;
  String errSurNameMsg = "";

  void checkSurName(String strSurName) {
    if (strSurName.trim().isEmpty) {
      isSurNameErr = true;
      txtSurName = "";
    }
    else {
      isSurNameErr = false;
      txtSurName = strSurName;
    }
    checkSurNameValidation();
    notifyListeners();
  }
  void checkSurNameValidation() {
    if (isSurNameErr) {
      if (txtSurName.trim().isEmpty) {
        errSurNameMsg = 'Please Enter SurName';
      }
      else
      {
        errSurNameMsg = 'Please Enter valid SurName';
      }
    }
  }



  String txtEmail = "";
  bool isEmailErr = true;
  String errEmailMsg = "";

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

  String txtNum = "";
  bool isNumErr = true;
  String errNumMsg = "";

  void checkNum(String strNum) {
    if (strNum.trim().isEmpty) {
      isNumErr = true;
      txtNum = "";
    } else if (!isPhoneNoValid(strNum)) {
      isNumErr = true;
      txtNum =strNum;
    }
    else {
      isNumErr = false;
      txtNum = strNum;
    }
    checkNumValidation();
    notifyListeners();
  }
  void checkNumValidation() {
    if (isNumErr) {
      if (txtNum.trim().isEmpty) {
        errNumMsg = 'Please Enter Num';
      }
      else
      {
        errNumMsg = 'Please Enter valid Num';
      }
    }
  }


  String txtHouseNumber = "";
  bool isHouseNumberErr = true;
  String errHouseNumberMsg = "";

  void checkHouseNumber(String strHouseNumber) {
    if (strHouseNumber.trim().isEmpty) {
      isHouseNumberErr = true;
      txtHouseNumber = "";
    }
    else {
      isHouseNumberErr = false;
      txtHouseNumber = strHouseNumber;
    }
    checkHouseNumberValidation();
    notifyListeners();
  }
  void checkHouseNumberValidation() {
    if (isHouseNumberErr) {
      if (txtHouseNumber.trim().isEmpty) {
        errHouseNumberMsg = 'Please Enter HouseNumber';
      }
      else
      {
        errHouseNumberMsg = 'Please Enter valid HouseNumber';
      }
    }
  }


  String txtStreet = "";
  bool isStreetErr = true;
  String errStreetMsg = "";

  void checkStreet(String strStreet) {
    if (strStreet.trim().isEmpty) {
      isStreetErr = true;
      txtStreet = "";
    }
    else {
      isStreetErr = false;
      txtStreet = strStreet;
    }
    checkStreetValidation();
    notifyListeners();
  }
  void checkStreetValidation() {
    if (isStreetErr) {
      if (txtStreet.trim().isEmpty) {
        errStreetMsg = 'Please Enter Street';
      }
      else
      {
        errStreetMsg = 'Please Enter valid Street';
      }
    }
  }

  String txtNeighbourhood = "";
  bool isNeighbourhoodErr = true;
  String errNeighbourhoodMsg = "";

  void checkNeighbourhood(String strNeighbourhood) {
    if (strNeighbourhood.trim().isEmpty) {
      isNeighbourhoodErr = true;
      txtNeighbourhood = "";
    }
    else {
      isNeighbourhoodErr = false;
      txtNeighbourhood = strNeighbourhood;
    }
    checkNeighbourhoodValidation();
    notifyListeners();
  }
  void checkNeighbourhoodValidation() {
    if (isNeighbourhoodErr) {
      if (txtNeighbourhood.trim().isEmpty) {
        errNeighbourhoodMsg = 'Please Enter Neighbourhood';
      }
      else
      {
        errNeighbourhoodMsg = 'Please Enter valid Neighbourhood';
      }
    }
  }


  String txtPostCode = "";
  bool isPostCodeErr = true;
  String errPostCodeMsg = "";

  void checkPostCode(String strPostCode) {
    if (strPostCode.trim().isEmpty) {
      isPostCodeErr = true;
      txtPostCode = "";
    }
    else {
      isPostCodeErr = false;
      txtPostCode = strPostCode;
    }
    checkPostCodeValidation();
    notifyListeners();
  }
  void checkPostCodeValidation() {
    if (isPostCodeErr) {
      if (txtPostCode.trim().isEmpty) {
        errPostCodeMsg = 'Please Enter PostCode';
      }
      else
      {
        errPostCodeMsg = 'Please Enter valid PostCode';
      }
    }
  }

  String txtPassword = "";
  bool isPasswordErr = true;
  String errPasswordMsg = "";

  void checkPassword(String strPassword) {
    if (strPassword.trim().isEmpty) {
      isPasswordErr = true;
      txtPassword = '';
    } else if(!validatePassword(strPassword)){
      isPasswordErr = true;
      txtPassword = strPassword;
    }
    else {
      isPasswordErr = false;
      txtPassword = strPassword;
    }
    checkPasswordValidation();
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


  String txtConfirmPassword = "";
  bool isConfirmPasswordErr = true;
  String errConfirmPasswordMsg = "";

  void checkConfirmPassword(String strConfirmPassword) {
    if (strConfirmPassword.trim().isEmpty) {
      isConfirmPasswordErr = true;
      txtConfirmPassword = "";
    }
    else {
      isConfirmPasswordErr = false;
      txtConfirmPassword = strConfirmPassword;
    }

    checkConfirmPasswordValidation();
    notifyListeners();
  }
  void checkConfirmPasswordValidation() {
    if (isConfirmPasswordErr) {
      if (txtConfirmPassword.trim().isEmpty) {
        errConfirmPasswordMsg = 'Please Confirm Your Password';
      }
      else
      {
        errConfirmPasswordMsg = 'Please Enter valid Confirm Password';
      }
    }
  }

  void checkValidation() {
    if ((!isNameErr) && (!isSurNameErr) &&
        (!isEmailErr) &&(!isNumErr) &&
        (!isHouseNumberErr ) && (isStreetErr)&&
        (isNeighbourhoodErr)&&(isPostCodeErr)&&
        (!isPasswordErr) &&(isConfirmPasswordErr)&&
        (selectedDate != DateTime.now()&&(selectedCityUser!="Select your city"))
    ){
      isValidValidation = true;
    } else {
      isValidValidation = false;
    }
  }





  //for Business




  String txtbBName = "";
  bool isbBNameErr = true;
  String errbBNameMsg = "";

  void checkbBName(String strbBName) {
    if (strbBName.trim().isEmpty) {
      isbBNameErr = true;
      txtbBName = "";
    }
    else {
      isbBNameErr = false;
      txtbBName = strbBName;
    }
    checkbBNameValidation();
    notifyListeners();
  }
  void checkbBNameValidation() {
    if (isbBNameErr) {
      if (txtbBName.trim().isEmpty) {
        errbBNameMsg = 'Please Enter Business Name';
      }
      else
      {
        errbBNameMsg = 'Please Enter valid Business Name';
      }
    }
  }



  String txtBName = "";
  bool isBNameErr = true;
  String errBNameMsg = "";

  void checkBName(String strBName) {
    if (strBName.trim().isEmpty) {
      isBNameErr = true;
      txtBName = "";
    }
    else {
      isBNameErr = false;
      txtBName = strBName;
    }
    checkBNameValidation();
    notifyListeners();
  }
  void checkBNameValidation() {
    if (isBNameErr) {
      if (txtBName.trim().isEmpty) {
        errBNameMsg = 'Please Enter Name';
      }
      else
      {
        errBNameMsg = 'Please Enter valid Name';
      }
    }
  }


  String txtBSurName = "";
  bool isBSurNameErr = true;
  String errBSurNameMsg = "";

  void checkBSurName(String strBSurName) {
    if (strBSurName.trim().isEmpty) {
      isBSurNameErr = true;
      txtBSurName = "";
    }
    else {
      isBSurNameErr = false;
      txtBSurName = strBSurName;
    }
    checkBSurNameValidation();
    notifyListeners();
  }
  void checkBSurNameValidation() {
    if (isBSurNameErr) {
      if (txtBSurName.trim().isEmpty) {
        errBSurNameMsg = 'Please Enter SurName';
      }
      else
      {
        errBSurNameMsg = 'Please Enter valid SurName';
      }
    }
  }



  String txtBEmail = "";
  bool isBEmailErr = true;
  String errBEmailMsg = "";

  void checkBEmail(String strBEmail) {
    if (strBEmail.trim().isEmpty) {
      isBEmailErr = true;
      txtBEmail = "";
    } else if (!isEmail(strBEmail)) {
      isBEmailErr = true;
      txtBEmail =strBEmail;
    }
    else {
      isBEmailErr = false;
      txtBEmail = strBEmail;
    }
    checkBEmailValidation();
    notifyListeners();
  }

  void checkBEmailValidation() {
    if (isBEmailErr) {
      if (txtBEmail.trim().isEmpty) {
        errBEmailMsg = 'Please Enter Email';
      }
      else
      {
        errBEmailMsg = 'Please Enter valid Email';
      }
    }
  }

  String txtBNum = "";
  bool isBNumErr = true;
  String errBNumMsg = "";

  void checkBNum(String strBNum) {
    if (strBNum.trim().isEmpty) {
      isBNumErr = true;
      txtBNum = "";
    } else if (!isPhoneNoValid(strBNum)) {
      isBNumErr = true;
      txtBNum =strBNum;
    }
    else {
      isBNumErr = false;
      txtBNum = strBNum;
    }
    checkBNumValidation();
    notifyListeners();
  }
  void checkBNumValidation() {
    if (isBNumErr) {
      if (txtBNum.trim().isEmpty) {
        errBNumMsg = 'Please Enter Num';
      }
      else
      {
        errBNumMsg = 'Please Enter valid Num';
      }
    }
  }


  String txtBHouseNumber = "";
  bool isBHouseNumberErr = true;
  String errBHouseNumberMsg = "";

  void checkBHouseNumber(String strBHouseNumber) {
    if (strBHouseNumber.trim().isEmpty) {
      isBHouseNumberErr = true;
      txtBHouseNumber = "";
    }
    else {
      isBHouseNumberErr = false;
      txtBHouseNumber = strBHouseNumber;
    }
    checkBHouseNumberValidation();
    notifyListeners();
  }
  void checkBHouseNumberValidation() {
    if (isBHouseNumberErr) {
      if (txtBHouseNumber.trim().isEmpty) {
        errBHouseNumberMsg = 'Please Enter HouseNumber';
      }
      else
      {
        errBHouseNumberMsg = 'Please Enter valid HouseNumber';
      }
    }
  }


  String txtBStreet = "";
  bool isBStreetErr = true;
  String errBStreetMsg = "";

  void checkBStreet(String strBStreet) {
    if (strBStreet.trim().isEmpty) {
      isBStreetErr = true;
      txtBStreet = "";
    }
    else {
      isBStreetErr = false;
      txtBStreet = strBStreet;
    }
    checkBStreetValidation();
    notifyListeners();
  }
  void checkBStreetValidation() {
    if (isBStreetErr) {
      if (txtBStreet.trim().isEmpty) {
        errBStreetMsg = 'Please Enter Street';
      }
      else
      {
        errBStreetMsg = 'Please Enter valid Street';
      }
    }
  }

  String txtBNeighbourhood = "";
  bool isBNeighbourhoodErr = true;
  String errBNeighbourhoodMsg = "";

  void checkBNeighbourhood(String strBNeighbourhood) {
    if (strBNeighbourhood.trim().isEmpty) {
      isBNeighbourhoodErr = true;
      txtBNeighbourhood = "";
    }
    else {
      isBNeighbourhoodErr = false;
      txtBNeighbourhood = strBNeighbourhood;
    }
    checkBNeighbourhoodValidation();
    notifyListeners();
  }
  void checkBNeighbourhoodValidation() {
    if (isBNeighbourhoodErr) {
      if (txtBNeighbourhood.trim().isEmpty) {
        errBNeighbourhoodMsg = 'Please Enter Neighbourhood';
      }
      else
      {
        errBNeighbourhoodMsg = 'Please Enter valid Neighbourhood';
      }
    }
  }


  String txtBPostCode = "";
  bool isBPostCodeErr = true;
  String errBPostCodeMsg = "";

  void checkBPostCode(String strBPostCode) {
    if (strBPostCode.trim().isEmpty) {
      isBPostCodeErr = true;
      txtBPostCode = "";
    }
    else {
      isBPostCodeErr = false;
      txtBPostCode = strBPostCode;
    }
    checkBPostCodeValidation();
    notifyListeners();
  }
  void checkBPostCodeValidation() {
    if (isBPostCodeErr) {
      if (txtBPostCode.trim().isEmpty) {
        errBPostCodeMsg = 'Please Enter PostCode';
      }
      else
      {
        errBPostCodeMsg = 'Please Enter valid PostCode';
      }
    }
  }

  String txtBPassword = "";
  bool isBPasswordErr = true;
  String errBPasswordMsg = "";

  void checkBPassword(String strBPassword) {
    if (strBPassword.trim().isEmpty) {
      isBPasswordErr = true;
      txtBPassword = '';
    } else if(!validatePassword(strBPassword)){
      isBPasswordErr = true;
      txtBPassword = strBPassword;
    }
    else {
      isBPasswordErr = false;
      txtBPassword = strBPassword;
    }
    checkBPasswordValidation();
    notifyListeners();
  }

  void checkBPasswordValidation() {
    if (isBPasswordErr) {
      if (txtBPassword.trim().isEmpty) {
        errBPasswordMsg = "Please enter Password";
      }

      else
      {
        errBPasswordMsg = 'Password must contain the following:\nA lowercase letter,A capital letter,A BNumber,\nMinimum 8 characters,A special character';
      }
    }
  }


  String txtBConfirmPassword = "";
  bool isBConfirmPasswordErr = true;
  String errBConfirmPasswordMsg = "";

  void checkBConfirmPassword(String strBConfirmPassword) {
    if (strBConfirmPassword.trim().isEmpty) {
      isBConfirmPasswordErr = true;
      txtBConfirmPassword = "";
    }
    else {
      isBConfirmPasswordErr = false;
      txtBConfirmPassword = strBConfirmPassword;
    }

    checkBConfirmPasswordValidation();
    notifyListeners();
  }
  void checkBConfirmPasswordValidation() {
    if (isBConfirmPasswordErr) {
      if (txtBConfirmPassword.trim().isEmpty) {
        errBConfirmPasswordMsg = 'Please Confirm Your Password';
      }
      else
      {
        errBConfirmPasswordMsg = 'Please Enter valid Confirm Password';
      }
    }
  }

  void checkBValidation() {
    if ((!isBNameErr) && (!isBSurNameErr) &&
        (!isBEmailErr) &&(!isBNumErr) &&
        (!isBHouseNumberErr ) && (isBStreetErr)&&
        (isBNeighbourhoodErr)&&(isBPostCodeErr)&&
        (!isBPasswordErr) &&(isBConfirmPasswordErr)&&
        (selectedDate != DateTime.now()&&(selectedCityUser!="Select your city"))
    ){
      isValidValidation = true;
    } else {
      isValidValidation = false;
    }
  }




























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
