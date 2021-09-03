import 'package:flutter/cupertino.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class CategoryDetailProvider extends ChangeNotifier{

  String partyName="wedding";
  String pricePerPerson="120Rs.";

  void setPartName(String value) {
    partyName = value;
    notifyListeners();
  }
  void setPrice(String value) {
    pricePerPerson = value;
    notifyListeners();
  }

}