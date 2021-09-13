import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier{

  String dropdownvalue = 'The name of the party';

  void setCategory(String value) {
    dropdownvalue = value;
    notifyListeners();
  }

}