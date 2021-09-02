import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_dasma/Country.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/commonWidgets/btnWidget.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/providers/signupProvider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../City.dart';
import '../UserData.dart';
import '../webservice.dart';
import 'SigninScreen.dart';
import 'package:provider/provider.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with Constant {

  // var tabIndex = 0;
  // DateTime selectedDate = DateTime.now();
  var txtBirthdayHint = "Birthday";
  var picked;

  var selectedCountryUser = "Select your country";
  // var selectedCityUser = "Select your city";
  var selectedCountryBusiness = "Select your country";
//  var selectedCityBusiness = "Select your city";

  var btnTextChooseFile = "Choose File";
  var dateText="Birth date";
    List<Data> countryList =[];
   List<DataCity> cityList =[];
   List<String> countryListData =[];
   List<String> cityListData =[];

  late SignupProvider signupProviderRead;
  late SignupProvider signupProviderWatch;

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
        initialDate: signupProviderWatch.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));


    if (picked != null && picked != signupProviderWatch.selectedDate)

        signupProviderWatch.setSelecteDate(picked)  ;
        dateText = "${signupProviderWatch.selectedDate.toLocal()}".split(' ')[0];

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      signupProviderRead=context.read<SignupProvider>();


    });
    Future.delayed(Duration.zero, () {
      getProgress(context);
    });
    fetchCountry();
    //fetchCity();
    getReadFilePermission();
  }



  @override
  Widget build(BuildContext context) {
    signupProviderWatch=context.watch<SignupProvider>();
    return SafeArea(
      child: Scaffold(

        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 16.w),
                child: Text(txtSignUp, style: TextStyle(fontSize: 40.sp, color:Color(0xff6E0CDB), fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0.h),
                child: Column(
                  children: [
                    ToggleSwitch(
                      totalSwitches: 2,
                minWidth: MediaQuery.of(context).size.width,
                activeBgColor: [colorPurple],
                inactiveBgColor: blackDark,
                inactiveFgColor: Colors.white,
                fontSize: 16.sp,
                      customTextStyles: [
                    TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900),
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900),

                      ],

                initialLabelIndex: signupProviderWatch.tabIndex,
                labels: [txtUser, txtBusiness],

                onToggle: (index) {
                  print('switched to: $index');
                  signupProviderWatch.setTabIndex(index);
                  // setState(() {
                  //   tabIndex = index ;
                  // });
                },

              ),

            ]),
),
              SizedBox(height: 10.0.h),

              Container(
               // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 16.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      signupProviderWatch.tabIndex==0?userTab():businessTab(),
                      BtnWidget((){

                        if (signupProviderWatch.tabIndex == 0){
                          validationForUserTab();
                        } else {
                          validationForBusinessTab();
                        }

                      }, btnText: txtSignUp),
                      SizedBox(height: 20.0.h)
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(txtHaveAccount),
                    Text(txtSignIn,style: TextStyle(color: colorPurple),),
                    SizedBox(height: 64.h),
                  ],
                ),

                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],

          ),
        ),
      ),
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
          height: 38.h,
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
            height: 38.h,
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

        CommonEditTextWidget(
          context: context,
          lableText:txtName ,
          txtController: _nameControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,


        ),
        SizedBox(height:15.h),
        CommonEditTextWidget(
          context: context,
          lableText:txtSurname ,
          txtController: _surnameControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),
        InkWell(
            onTap: (){
              _selectDate(context);
            },
            child: getTextWidgetDate()),

        CommonEditTextWidget(
          context: context,
          lableText:txtEmail ,
          txtController: _emailControllerU,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtPhnNumber ,
          txtController: _phoneNumControllerU,
          textInputType: TextInputType.phone,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        InkWell(
            onTap: (){
              signupProviderWatch.setCountry(selectedCountryUser);

              SelectDialog.showModal<String>(
                context,
                label: "Select your country",
                selectedValue: signupProviderWatch.country,
                items: countryListData,
                onChange: (String selected) {
                  signupProviderWatch.setCountry(selected);
                  selectedCountryUser = signupProviderWatch.country;

                  signupProviderWatch.setCityHint("Select your city");
                  signupProviderWatch.setStateViseCountry(signupProviderWatch.selectedCityUser);
                  // setState(() {
                  //   selectedCityUser="Select your city";
                  //   signupProviderWatch.setStateViseCountry(selectedCityUser);
                  // });

                  for (var i = 0; i < countryList.length; i++) {
                    if(selectedCountryUser==countryList[i].title)
                    {
                      Future.delayed(Duration.zero, () {
                        getProgress(context);
                      });
                      fetchCity(countryList[i].id);
                    }
                  }
                  // setState(() {
                  //   ex1 = selected;
                  //   selectedCountryUser = ex1;
                  //   for (var i = 0; i < countryList.length; i++) {
                  //     if(selectedCountryUser==countryList[i].title)
                  //       {
                  //         Future.delayed(Duration.zero, () {
                  //           getProgress(context);
                  //         });
                  //         fetchCity(countryList[i].id);
                  //       }
                  //   }
                  //
                  // });
                },
              );

              // setState(() {
              //   selectedCountryUser = ex1;
              // });
            },
            child: getTextWidget(selectedCountryUser)),
        SizedBox(height:5.h),
        InkWell(
            onTap: () {
             signupProviderWatch.setStateViseCountry(signupProviderWatch.selectedCityUser);

              SelectDialog.showModal<String>(
                context,
               label: "Select your city",
                selectedValue: signupProviderWatch.state,
                items: cityListData,
                onChange: (String selected) {
                  signupProviderWatch.setStateViseCountry(selected);
                  signupProviderWatch.setCityHint(signupProviderWatch.state);
                  // setState(() {
                  //   ex1 = selected;
                  //   selectedCityUser = ex1;
                  // });
                },
              );

              // setState(() {
              //   selectedCityUser = ex1;
              // });
            },

            child: getTextWidget(signupProviderWatch.selectedCityUser)),
        SizedBox(height:5.h),


        CommonEditTextWidget(
          context: context,
          lableText:txtHouseNumber ,
          txtController: _numOfHouseControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),



        SizedBox(height:15.h),
        CommonEditTextWidget(
          context: context,
          lableText:txtStreet ,
          txtController: _streetControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtNeighbourhood ,
          txtController: _neighborhoodControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtPostCode ,
          txtController: _postCodeControllerU,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtPassword ,
          txtController: _passControllerU,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtConfirmPassword ,
          txtController: _confPassControllerU,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 32.w, bottom: 10.0.h),
            child: Text(txtUploadId, style: TextStyle(fontSize: 14.sp),)),

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
                  signupProviderWatch.setFile(picked.files.first.name);

                }

              }, child: Text(btnTextChooseFile,
                style: TextStyle(color: Colors.black54),), style: ElevatedButton.styleFrom(
                  primary: Colors.white),

              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(signupProviderWatch.strNoFileChose, style: TextStyle(fontSize: 14.sp)),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget businessTab()
  {
    return Column(
      children: [

        CommonEditTextWidget(
          context: context,
          lableText:txtBusinessName ,
          txtController: _bNameControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

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
          //  hint: loginProviderWatch.userTypeValue == null
            hint: signupProviderWatch.businessType == null
                ? Text('Dropdown')
              //  : Text(""+loginProviderWatch.userTypeValue.toString(),
                : Text(""+signupProviderWatch.businessType.toString(),
              style: TextStyle(color: Colors.black),
            ),
            isExpanded: true,
            iconSize: 30.0.r,
            underline: Container(),
            style: TextStyle(color: Colors.black),
            items: [txtSinger, txtRestaurant, txtCameraMan,
              txtPhotographer, txtCameraManAndPhotographer,
              txtDJ, txtDancers, txtDecor,
              txtHairdressersAndMakeupArtists].map(
                  (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
           //   loginProviderWatch.setUserType(val.toString());
              signupProviderWatch.setBusinessType(val.toString());
              // setState(
              //       () {
              //     _dropDownValue = val.toString();
              //   },
              // );
            },
          ),
        ),

        /*SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtBusinessType ,
          txtController: _typeBControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),*/

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtName ,
          txtController: _nameControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtSurname ,
          txtController: _surNameControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtEmail ,
          txtController: _emailControllerB,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtPhnNumber,
          txtController: _phoneNumControllerB,
          textInputType: TextInputType.phone,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtPassword ,
          txtController: _passwordControllerB,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtConfirmPassword ,
          txtController: _confPassControllerB,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),


        InkWell(
            onTap: (){
              // String ex1 = selectedCountryBusiness;
              signupProviderWatch.setBusinessCountry(selectedCountryBusiness);

              SelectDialog.showModal<String>(
                context,
                label: "Select your country",
                selectedValue: signupProviderWatch.businesscountry,
                items: countryListData,
                onChange: (String selected) {
                  signupProviderWatch.setBusinessCountry(selected);
                  selectedCountryBusiness = signupProviderWatch.businesscountry;

                  signupProviderWatch.setBusinessCityHint("Select your city");
                  signupProviderWatch.setBusinessState(signupProviderWatch.selectedCityBusiness);
                  for (var i = 0; i < countryList.length; i++) {
                    if(selectedCountryBusiness==countryList[i].title)
                    {
                      Future.delayed(Duration.zero, () {
                        getProgress(context);
                      });
                      fetchCity(countryList[i].id);
                    }
                  }
                  // setState(() {
                  //   ex1 = selected;
                  //   selectedCountryBusiness = ex1;
                  //   for (var i = 0; i < countryList.length; i++) {
                  //     if(selectedCountryBusiness==countryList[i].title)
                  //     {
                  //       Future.delayed(Duration.zero, () {
                  //         getProgress(context);
                  //       });
                  //       fetchCity(countryList[i].id);
                  //     }
                  //   }
                  // });
                },
              );

              // setState(() {
              //   selectedCountryBusiness = ex1;
              // });
            },
            child: getTextWidget(selectedCountryBusiness)),
        SizedBox(height:5.h),

        InkWell(
            onTap: () {

              signupProviderWatch.setBusinessState(signupProviderWatch.selectedCityBusiness);
              SelectDialog.showModal<String>(
                context,
                label: signupProviderWatch.selectedCityBusiness,
                selectedValue: signupProviderWatch.businessState,
                items: cityListData,
                onChange: (String selected) {
                  signupProviderWatch.setBusinessState(selected);
                  signupProviderWatch.setBusinessCityHint(signupProviderWatch.businessState);
                  // setState(() {
                  //   ex1 = selected;
                  //   selectedCityBusiness = ex1;
                  //   //fetchCity();
                  // });
                },
              );

              // setState(() {
              //   selectedCityBusiness = ex1;
              // });
            },

            child: getTextWidget(signupProviderWatch.selectedCityBusiness)),
        SizedBox(height:5.h),


        CommonEditTextWidget(
          context: context,
          lableText:txtHouseNumber ,
          txtController: _numHouseControllerB,
          textInputType: TextInputType.text,

          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtStreet ,
          txtController: _streetControllerB,
          textInputType: TextInputType.text,

          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtNeighbourhood ,
          txtController: _neighborhoodControllerB,
          textInputType: TextInputType.text,

          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        CommonEditTextWidget(
          context: context,
          lableText:txtPostCode ,
          txtController: _postCodeControllerB,
          textInputType: TextInputType.text,

          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),


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
                  signupProviderWatch.setFile(picked.files.first.name);

                }

              }, child: Text("Choose File",
                style: TextStyle(color: Colors.black54),), style: ElevatedButton.styleFrom(
                  primary: Colors.white),

              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(signupProviderWatch.strNoFileChose, style: TextStyle(fontSize: 14.sp)),
              )

            ],
          ),
        )
      ],
    );
  }

  Future<bool> getReadFilePermission() async {
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Read permission granted");
      return true;
    } else {
    // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();
     // Map<Permission, PermissionStatus> statuses = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      print(statuses[Permission.storage]);
      return false;
    }
  }



  void validationForUserTab(){

    if (_nameControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyName);
      return;
    } else if (_surnameControllerU!.text.isEmpty){
      showSnackBar(context, errEmptySurname);
      return;
    } else if (dateText == "Birth date"){
      showSnackBar(context, errSelectYourBirthdate);
      return;
    } else if (_emailControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyEmail);
      return;
    } else if (!isEmail(_emailControllerU!.text)){
      showSnackBar(context, errNotValidEmail);
      return;
    } else if (_phoneNumControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyPhoneNumber);
      return;
    } else if (selectedCountryUser == "Select your country"){
      showSnackBar(context, errSelectCountry);
      return;
    } else if (signupProviderWatch.selectedCityUser == "Select your city"){
      showSnackBar(context, errSelectCity);
      return;
    } else if (_numOfHouseControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyHouseNo);
      return;
    } else if (_streetControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyStreet);
      return;
    } else if (_neighborhoodControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyNeighbourhood);
      return;
    } else if (_postCodeControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyPostCode);
      return;
    } else if (_passControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyPassword);
      return;
    } else if (!validatePassword(_passControllerU!.text)){
      showSnackBar(context, errPasswordNotValid);
      return;
    } else if (_confPassControllerU!.text.isEmpty){
      showSnackBar(context, errEmptyConfirmPass);
      return;
    } else if (_passControllerU!.text != _confPassControllerU!.text){
      showSnackBar(context, errNotMatchConfirmPass);
      return;
    } /*else if (btnTextChooseFile == "Choose File"){
      showSnackBar(context, "please choose file");
      return;
    }*/
    else{
      Future.delayed(Duration.zero, () {
        getProgress(context);
      });
      fetchUserRegister();
    }

  }

  void validationForBusinessTab() {
    if (_bNameControllerB!.text.isEmpty){
      showSnackBar(context,errEmptyBusinessName);
      return;
    } else if (_typeBControllerB!.text.isEmpty){
      showSnackBar(context, errTypeBusinessEmpty);
      return;
    } else if (_nameControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyName);
      return;
    } else if (_surNameControllerB!.text.isEmpty){
      showSnackBar(context, errEmptySurname);
      return;
    } else if (_emailControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyEmail);
      return;
    } else if (!isEmail(_emailControllerB!.text)){
      showSnackBar(context, errNotValidEmail);
      return;
    } else if (_phoneNumControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyPhoneNumber);
      return;
    } /*else if (isPhoneNoValid(_phoneNumControllerB!.text)){
      showSnackBar(context, "Phone number is not valid");
      return;
    }*/ else if (_passwordControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyPassword);
      return;
    } /*else if (!validatePassword(_passwordControllerB!.text)){
      showSnackBar(context, "Password is not valid");
      return;
    }*/ else if (_confPassControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyConfirmPass);
      return;
    } else if (_passwordControllerB!.text != _confPassControllerB!.text){
      showSnackBar(context, errNotMatchConfirmPass);
      return;
    } else if (selectedCountryBusiness == "Select your country"){
      showSnackBar(context, errSelectCountry);
      return;
    } else if (signupProviderWatch.selectedCityBusiness == "Select your city"){
      showSnackBar(context, errSelectCity);
      return;
    } else if (_numHouseControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyHouseNo);
      return;
    } else if (_streetControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyStreet);
      return;
    } else if (_neighborhoodControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyNeighbourhood);
      return;
    } else if (_postCodeControllerB!.text.isEmpty){
      showSnackBar(context, errEmptyPostCode);
      return;
    } /*else if (strNoFileChose == "No File chosen"){
      showSnackBar(context, "please choose file");
      return;
    } */else {
      fetchBusinessRegister();
      Future.delayed(Duration.zero, () {
        getProgress(context);
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
          // Country cc;
          if (success) {
            Navigator.pop(context);
            signupProviderWatch.setCountryObject(Country.fromJson(json.decode(response.body)));
            countryList.addAll(signupProviderWatch.cc.datalist);
            for (var i = 0; i < countryList.length; i++) {
              countryListData.add(countryList[i].title);
            }
            // setState(() {
            //   cc=Country.fromJson(json.decode(response.body));
            //   countryList.addAll(cc.datalist);
            //   for (var i = 0; i < countryList.length; i++) {
            //     countryListData.add(countryList[i].title);
            //   }
            //
            // });
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
    print("city api call:"+id);
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

          if (success) {
            signupProviderWatch.setCityObject(City.fromJson(json.decode(response.body)));
            cityList.clear();
            cityListData.clear();
            cityList.addAll(signupProviderWatch.cityObject.datalist);
            for (var i = 0; i < cityList.length; i++) {
              cityListData.add(cityList[i].title);
            }
            // setState(() {
            //   cc=City.fromJson(json.decode(response.body));
            //   cityList.addAll(cc.datalist);
            //   for (var i = 0; i < cityList.length; i++) {
            //     cityListData.add(cityList[i].title);
            //   }
            //
            // });
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



