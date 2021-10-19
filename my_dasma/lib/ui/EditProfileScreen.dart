import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/btnWidget.dart';

import 'package:select_dialog/select_dialog.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../City.dart';
import '../Country.dart';
import '../UserData.dart';
import '../webservice.dart';
import 'SigninScreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  var tabIndex = 0;
  DateTime selectedDate = DateTime.now();
  var txtBirthdayHint = "Birthday";
  var picked;
  var strNoFileChose = "No File chosen";
  var btnTextChooseFile = "Choose File";
  var selectedCountryUser = "Select your country";
  var selectedCityUser = "Select your city";
  var selectedCountryBusiness = "Select your country";
  var selectedCityBusiness = "Select your city";
  var btnTextReg = "Registration";
  var dateText="Birth date";
  List<Data> countryList =[];
  List<DataCity> cityList =[];
  List<String> countryListData =[];
  List<String> cityListData =[];
  TextEditingController? _bNameControllerB = TextEditingController();
  TextEditingController? _typeBControllerB = TextEditingController();
  TextEditingController? _nameControllerB = TextEditingController();
  TextEditingController? _surNameControllerB = TextEditingController();
  TextEditingController? _emailControllerB = TextEditingController();
  TextEditingController? _phoneNumControllerB = TextEditingController();
  TextEditingController? _passwordControllerB = TextEditingController();
  TextEditingController? _confPassControllerB = TextEditingController();
  TextEditingController? _sCountryControllerB = TextEditingController();
  TextEditingController? _sCityControllerB = TextEditingController();
  TextEditingController? _numHouseControllerB = TextEditingController();
  TextEditingController? _streetControllerB = TextEditingController();
  TextEditingController? _neighborhoodControllerB = TextEditingController();
  TextEditingController? _postCodeControllerB = TextEditingController();

  TextEditingController? _nameControllerU = TextEditingController();
  TextEditingController? _surnameControllerU = TextEditingController();
  TextEditingController? _birthdayControllerU = TextEditingController();
  TextEditingController? _emailControllerU = TextEditingController();
  TextEditingController? _phoneNumControllerU = TextEditingController();
  TextEditingController? _sCountryControllerU = TextEditingController();
  TextEditingController? _sCityControllerU = TextEditingController();
  TextEditingController? _numOfHouseControllerU = TextEditingController();
  TextEditingController? _streetControllerU = TextEditingController();
  TextEditingController? _neighborhoodControllerU = TextEditingController();
  TextEditingController? _postCodeControllerU = TextEditingController();
  TextEditingController? _passControllerU = TextEditingController();
  TextEditingController? _confPassControllerU = TextEditingController();

  String txtBirthday = "Birthday";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));


    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateText = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      getProgress();
    });
    fetchCountry();
    //fetchCity();
    // getReadFilePermission();
  }

  Future getProgress()
  {return
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 60.0.w,
          height: 60.0.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
        ),

        body: Container(
         // padding: EdgeInsets.symmetric(horizontal: 32.0.w),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.r))
          ),

          child: ListView(
            children: [

              SizedBox(height: 40,),

              Container(child: Center(
                child: Text("Edit Profile",
                  style: TextStyle(fontSize: 25.sp,
                      fontWeight: FontWeight.bold),),
              )),

              SizedBox(height: 30.h,),

              Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      margin: EdgeInsets.only(top: 48.h, left: 32.w, right: 32.w),
                      height: 2.h,decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Color(0xff6E0CDB),
                      borderRadius: BorderRadius.circular(16.0.r),
                    ),),
                    Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 16.0.r,
                                  child: Icon(
                                    Icons.edit,
                                    size: 22.0.r,
                                    color: Color(0xff6E0CDB),
                                  ),
                                ),
                              ),
                              radius: 38.0.r,
                              backgroundImage: /*AssetImage(
                            'assets/images/user-image-default.png'),*/
                              AssetImage('assets/profile.png'),
                            ),
                          ),)
                    ),
                  ]
              ),

              SizedBox(height: 20.h,),

              userTab(),

            ],
          ),
        )
      ),
    );
  }

  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool validatePassword(String value) {
    /*Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';*/

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$';
    RegExp regex = new RegExp(pattern);
    // print(value);

    /*if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;*/

    return regex.hasMatch(pattern);
  }

  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }

  Widget getFieldWidget(String strHint, {TextInputType type=TextInputType.text, TextEditingController? controller, bool obscureTxtBoolean = false}) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 45.h,
          padding: EdgeInsets.only(
              top: 4.h, left: 16.w, right: 16.w, bottom: 4.h
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.r)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.r
                )
              ]
          ),
          child: InkWell(
            child: TextField(
              obscureText: obscureTxtBoolean,
              keyboardType: type,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: strHint,
                  hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }

  Widget setupAlertDialogContainer() {
    return Container(
      height: 300.0.h, // Change as per your requirement
      width: 300.0.w, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Gujarat, India'),
          );
        },
      ),
    );
  }

  Widget getTextWidget(String strText){
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width/1.2,
            height: 45.h,
            padding: EdgeInsets.only(
                top: 4.h,left: 16.w, right: 16.w, bottom: 4.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(50.r)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.r
                  )
                ]
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(strText))
          // child: Text(selectedDate == null ? strText : "${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(color: Colors.grey),)),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }

  Widget getTextWidgetDate(){
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width/1.2,
            height: 45.h,
            padding: EdgeInsets.only(
                top: 4.h,left: 16.w, right: 16.w, bottom: 4.h
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(50)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.r
                  )
                ]
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(dateText))
          // child: Text(selectedDate == null ? strText : "${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(color: Colors.grey),)),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }

  Widget userTab()
  {
    var picked;

    return Column(
      children: [
        getFieldWidget("Name", controller: _nameControllerU),
        getFieldWidget("Surname", controller: _surnameControllerU),
        InkWell(
            onTap: (){
              _selectDate(context);
            },
            child: getTextWidgetDate()),
        getFieldWidget("Email address", controller: _emailControllerU ,type: TextInputType.emailAddress),
        getFieldWidget("Phone number", controller: _phoneNumControllerU,type: TextInputType.phone),

        InkWell(
            onTap: (){
              String ex1 = selectedCountryUser;

              SelectDialog.showModal<String>(
                context,
                label: "Select your country",
                selectedValue: ex1,
                items: countryListData,
                onChange: (String selected) {
                  setState(() {
                    ex1 = selected;
                    selectedCountryUser = ex1;
                    for (var i = 0; i < countryList.length; i++) {
                      if(selectedCountryUser==countryList[i].title)
                      {
                        Future.delayed(Duration.zero, () {
                          getProgress();
                        });
                        fetchCity(countryList[i].id);
                      }
                    }

                  });
                },
              );

              setState(() {
                selectedCountryUser = ex1;
              });
            },
            child: getTextWidget(selectedCountryUser)),

        InkWell(
            onTap: () {
              String ex1 = selectedCityUser;

              SelectDialog.showModal<String>(
                context,
                label: "Select your city",
                selectedValue: ex1,
                items: cityListData,
                onChange: (String selected) {
                  setState(() {
                    ex1 = selected;
                    selectedCityUser = ex1;
                  });
                },
              );

              setState(() {
                selectedCityUser = ex1;
              });
            },

            child: getTextWidget(selectedCityUser)),

        getFieldWidget("Number of house, building, apartment", controller: _numOfHouseControllerU),
        getFieldWidget("Street", controller: _streetControllerU),
        getFieldWidget("Neighborhood", controller: _neighborhoodControllerU),
        getFieldWidget("Post code", controller: _postCodeControllerU,type: TextInputType.number),
        getFieldWidget("Password", controller: _passControllerU, obscureTxtBoolean: true),
        getFieldWidget("Confirm your password", controller: _confPassControllerU ,obscureTxtBoolean: true),

        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 32.0.w, top: 16.0.h, bottom: 4.0.h),
            child: Text("Upload an ID", style: TextStyle(fontSize: 14.sp),)),

        Container(
          margin: EdgeInsets.only(left: 32.0.w, bottom: 16.0.h),
          child: Row(
            children: [
              ElevatedButton(onPressed: () async {
                picked = await FilePicker.platform.pickFiles();

                if (picked == null){
                  Center(child: CircularProgressIndicator());
                } else {
                  print(picked.files.first.name != null && picked.files.first.name != ""?picked.files.first.name:"");
                  //Text(picked.files.first.name, style: TextStyle(fontSize: 14));

                  setState(() {
                    strNoFileChose = picked.files.first.name;
                  });
                }

              }, child: Text(btnTextChooseFile,
                style: TextStyle(color: Colors.black54),), style: ElevatedButton.styleFrom(
                  primary: Colors.white),

              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(strNoFileChose, style: TextStyle(fontSize: 14.sp)),
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: BtnWidget((){

          }, btnText: "Edit Profile"),
        ),

      ],
    );
  }

  Widget businessTab()
  {
    return Column(
      children: [

        getFieldWidget("Business name", controller: _bNameControllerB),
        getFieldWidget("Type of business", controller: _typeBControllerB),
        getFieldWidget("Name", controller: _nameControllerB),
        getFieldWidget("Surname", controller: _surNameControllerB),
        getFieldWidget("Email address", controller: _emailControllerB ,type: TextInputType.emailAddress),
        getFieldWidget("Phone number", controller: _phoneNumControllerB, type: TextInputType.phone),
        getFieldWidget("Password", controller: _passwordControllerB, obscureTxtBoolean: true),
        getFieldWidget("Confirm your password", controller: _confPassControllerB, obscureTxtBoolean: true),
        InkWell(
            onTap: (){
              String ex1 = selectedCountryBusiness;

              SelectDialog.showModal<String>(
                context,
                label: "Select your country",
                selectedValue: ex1,
                items: countryListData,
                onChange: (String selected) {
                  setState(() {
                    ex1 = selected;
                    selectedCountryBusiness = ex1;
                    for (var i = 0; i < countryList.length; i++) {
                      if(selectedCountryBusiness==countryList[i].title)
                      {
                        Future.delayed(Duration.zero, () {
                          getProgress();
                        });
                        fetchCity(countryList[i].id);
                      }
                    }
                  });
                },
              );

              setState(() {
                selectedCountryBusiness = ex1;
              });
            },
            child: getTextWidget(selectedCountryBusiness)),

        InkWell(
            onTap: () {
              String ex1 = selectedCityBusiness;

              SelectDialog.showModal<String>(
                context,
                label: "Select your city",
                selectedValue: ex1,
                items: cityListData,
                onChange: (String selected) {
                  setState(() {
                    ex1 = selected;
                    selectedCityBusiness = ex1;
                    //fetchCity();
                  });
                },
              );

              setState(() {
                selectedCityBusiness = ex1;
              });
            },

            child: getTextWidget(selectedCityBusiness)),
        getFieldWidget("Number of house, building, apartment", controller: _numHouseControllerB),
        getFieldWidget("Street", controller: _streetControllerB),
        getFieldWidget("Neighborhood", controller: _neighborhoodControllerB),
        getFieldWidget("Post code", controller: _postCodeControllerB),

        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 32.0.w, top: 16.0.h, bottom: 4.0.h),
            child: Text("Upload document", style: TextStyle(fontSize: 14.sp),)),

        Container(
          margin: EdgeInsets.only(left: 32.0.w, bottom: 16.0.h),
          child: Row(
            children: [
              ElevatedButton(onPressed: () async {
                picked = await FilePicker.platform.pickFiles();

                if (picked == null){
                  Center(child: CircularProgressIndicator());
                } else {
                  print(picked.files.first.name != null && picked.files.first.name != ""?picked.files.first.name:"");
                  //Text(picked.files.first.name, style: TextStyle(fontSize: 14));
                  setState(() {
                    strNoFileChose = picked.files.first.name;
                  });
                }

              }, child: Text("Choose File",
                style: TextStyle(color: Colors.black54),), style: ElevatedButton.styleFrom(
                  primary: Colors.white),

              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(strNoFileChose, style: TextStyle(fontSize: 14.sp)),
              )

            ],
          ),
        )
      ],
    );
  }

  // Future<bool> getReadFilePermission() async {
  //   if (await Permission.storage.request().isGranted) {
  //     // Either the permission was already granted before or the user just granted it.
  //     print("Read permission granted");
  //     return true;
  //   } else {
  //     // You can request multiple permissions at once.
  //     Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();
  //     // Map<Permission, PermissionStatus> statuses = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  //     print(statuses[Permission.storage]);
  //     return false;
  //   }
  // }

  showSnackBar(BuildContext context, String message) {
    // ScaffoldMessenger(key: ,).of(context).showSnackBar(SnackBar(content: Text(message)));
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void validationForUserTab(){

    if (_nameControllerU!.text.isEmpty){
      showSnackBar(context, "Name is empty");
      return;
    } else if (_surnameControllerU!.text.isEmpty){
      showSnackBar(context, "Surname is empty");
      return;
    } else if (dateText == "Birth date"){
      showSnackBar(context, "please select your birthdate");
      return;
    } else if (_emailControllerU!.text.isEmpty){
      showSnackBar(context, "Email is empty");
      return;
    } else if (!isEmail(_emailControllerU!.text)){
      showSnackBar(context, "Email is not valid");
      return;
    } else if (_phoneNumControllerU!.text.isEmpty){
      showSnackBar(context, "Phone number is empty");
      return;
    } else if (selectedCountryUser == "Select your country"){
      showSnackBar(context, "please select your country");
      return;
    } else if (selectedCityUser == "Select your city"){
      showSnackBar(context, "please select your city");
      return;
    } else if (_numOfHouseControllerU!.text.isEmpty){
      showSnackBar(context, "Number of house is empty");
      return;
    } else if (_streetControllerU!.text.isEmpty){
      showSnackBar(context, "Street is empty");
      return;
    } else if (_neighborhoodControllerU!.text.isEmpty){
      showSnackBar(context, "Neighborhood is empty");
      return;
    } else if (_postCodeControllerU!.text.isEmpty){
      showSnackBar(context, "Post code is empty");
      return;
    } else if (_passControllerU!.text.isEmpty){
      showSnackBar(context, "Password is empty");
      return;
    } else if (!validatePassword(_passControllerU!.text)){
      showSnackBar(context, "Password is not valid");
      return;
    } else if (_confPassControllerU!.text.isEmpty){
      showSnackBar(context, "confirm password is empty");
      return;
    } else if (_passControllerU!.text != _confPassControllerU!.text){
      showSnackBar(context, "password is not same");
      return;
    } /*else if (btnTextChooseFile == "Choose File"){
      showSnackBar(context, "please choose file");
      return;
    }*/
    else{
      Future.delayed(Duration.zero, () {
        getProgress();
      });
      fetchUserRegister();
    }

  }

  void validationForBusinessTab() {
    if (_bNameControllerB!.text.isEmpty){
      showSnackBar(context, "Business name is empty");
      return;
    } else if (_typeBControllerB!.text.isEmpty){
      showSnackBar(context, "Type of business is empty");
      return;
    } else if (_nameControllerB!.text.isEmpty){
      showSnackBar(context, "Name is empty");
      return;
    } else if (_surNameControllerB!.text.isEmpty){
      showSnackBar(context, "Surname is empty");
      return;
    } else if (_emailControllerB!.text.isEmpty){
      showSnackBar(context, "Email is empty");
      return;
    } else if (!isEmail(_emailControllerB!.text)){
      showSnackBar(context, "Email is not valid");
      return;
    } else if (_phoneNumControllerB!.text.isEmpty){
      showSnackBar(context, "Phone number is empty");
      return;
    } /*else if (isPhoneNoValid(_phoneNumControllerB!.text)){
      showSnackBar(context, "Phone number is not valid");
      return;
    }*/ else if (_passwordControllerB!.text.isEmpty){
      showSnackBar(context, "Password is empty");
      return;
    } /*else if (!validatePassword(_passwordControllerB!.text)){
      showSnackBar(context, "Password is not valid");
      return;
    }*/ else if (_confPassControllerB!.text.isEmpty){
      showSnackBar(context, "confirm password is empty");
      return;
    } else if (_passwordControllerB!.text != _confPassControllerB!.text){
      showSnackBar(context, "password is not same");
      return;
    } else if (selectedCountryBusiness == "Select your country"){
      showSnackBar(context, "please select your country");
      return;
    } else if (selectedCityBusiness == "Select your city"){
      showSnackBar(context, "please select your city");
      return;
    } else if (_numHouseControllerB!.text.isEmpty){
      showSnackBar(context, "Number of house is empty");
      return;
    } else if (_numHouseControllerB!.text.isEmpty){
      showSnackBar(context, "Number of house is empty");
      return;
    } else if (_streetControllerB!.text.isEmpty){
      showSnackBar(context, "Street is empty");
      return;
    } else if (_neighborhoodControllerB!.text.isEmpty){
      showSnackBar(context, "Neighborhood is empty");
      return;
    } else if (_postCodeControllerB!.text.isEmpty){
      showSnackBar(context, "Post code is empty");
      return;
    } /*else if (strNoFileChose == "No File chosen"){
      showSnackBar(context, "please choose file");
      return;
    } */else {
      fetchBusinessRegister();
      Future.delayed(Duration.zero, () {
        getProgress();
      });
    }
  }


  fetchUserRegister() async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["name"] =  _nameControllerU!.text;
    map["surname"] = _surnameControllerU!.text;
    map["phoneno"] = _phoneNumControllerU!.text;
    map["dob"] = dateText;
    map["email"] = _emailControllerU!.text;
    map["country"] = _sCountryControllerU!.text;
    map["city"] = _sCityControllerU!.text;
    map["house"] = _numOfHouseControllerU!.text;
    map["street"] = _streetControllerU!.text;
    map["suburb"] = _neighborhoodControllerU!.text;
    map["postcode"] = _postCodeControllerU!.text;
    map["password"] = _passControllerU!.text;


    Webservice().loadPost(getHomeNews, map).then(
          (model) =>
      {

      },
    );
  }

  Resource<User> get getHomeNews {
    return Resource(
        url: "https://www.mydasma.com/mydasma_api/api/user/user_registration",
        parse: (response) {
          Navigator.pop(context);
          final result = json.decode(response.body);
          print("" + ".......getSupplierLogin......." + result.toString());
          bool success = result["status"];
          if (success) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
          }
          else {
            String message =result["message"];
            showSnackBar(context, message);
          }
          return result;
        }
    );
  }



  fetchCountry() async {
    /*Map<String, dynamic> map = Map<String, dynamic>();
    map["name"] =  _nameControllerU!.text;
    map["surname"] = _surnameControllerU!.text;
    map["phoneno"] = _phoneNumControllerU!.text;
    map["dob"] = dateText;
    map["email"] = _emailControllerU!.text;
    map["country"] = _sCountryControllerU!.text;
    map["city"] = _sCityControllerU!.text;
    map["house"] = _numOfHouseControllerU!.text;
    map["street"] = _streetControllerU!.text;
    map["suburb"] = _neighborhoodControllerU!.text;
    map["postcode"] = _postCodeControllerU!.text;
    map["password"] = _passControllerU!.text;*/


    Webservice().loadGET(getCountry).then(
          (model) =>
      {
      },
    );
  }

  Resource<Country> get getCountry {
    return Resource(
        url: "https://www.mydasma.com/mydasma_api/api/user/fetch_country",
        parse: (response) {
          final result = json.decode(response.body);
          print("" + ".......getSupplierLogin......." + result.toString());
          bool success = result["status"];
          Country cc;
          if (success) {
            Navigator.pop(context);
            setState(() {
              cc=Country.fromJson(json.decode(response.body));
              countryList.addAll(cc.datalist);
              for (var i = 0; i < countryList.length; i++) {
                countryListData.add(countryList[i].title);
              }

            });
          }
          else {
            String message =result["message"];
            showSnackBar(context, message);
          }
          return result as Country;
        }
    );
  }

  fetchCity(String id) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["c_id"] =  id;

    Webservice().loadPost(getCity,map).then(
          (model) =>
      {
      },
    );
  }

  Resource<City> get getCity {
    return Resource(
        url: "https://www.mydasma.com/mydasma_api/api/user/fetch_city",
        parse: (response) {
          Navigator.pop(context);
          final result = json.decode(response.body);
          print("" + ".......getSupplierLogin......." + result.toString());
          bool success = result["status"];
          City cc;
          if (success) {
            setState(() {
              cc=City.fromJson(json.decode(response.body));
              cityList.addAll(cc.datalist);
              for (var i = 0; i < cityList.length; i++) {
                cityListData.add(cityList[i].title);
              }

            });
          }
          else {
            String message =result["message"];
            showSnackBar(context, message);
          }
          return result as City;
        }
    );
  }

  fetchBusinessRegister() async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["business_name"] =  _bNameControllerB!.text;
    map["business_type_id"] = "1";
    map["name"] =  _nameControllerB!.text;
    map["surname"] = _surNameControllerB!.text;
    map["phoneno"] = _phoneNumControllerB!.text;
    map["dob"] = dateText;
    map["email"] = _emailControllerB!.text;
    map["country"] = _sCountryControllerB!.text;
    map["city"] = _sCityControllerB!.text;
    map["house"] = _numHouseControllerB!.text;
    map["street"] = _streetControllerB!.text;
    map["suburb"] = _neighborhoodControllerB!.text;
    map["postcode"] = _postCodeControllerB!.text;
    map["password"] = _passwordControllerB!.text;


    Webservice().loadPost(getBusiness, map).then(
          (model) =>
      {

      },
    );
  }

  Resource<User> get getBusiness {
    return Resource(
        url: "https://www.mydasma.com/mydasma_api/api/user/business_registration",
        parse: (response) {
          Navigator.pop(context);
          final result = json.decode(response.body);
          print("" + ".......getSupplierLogin......." + result.toString());
          bool success = result["status"];
          if (success) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
          }
          else {
            String message =result["message"];
            showSnackBar(context, message);
          }
          return result;
        }
    );
  }
}
