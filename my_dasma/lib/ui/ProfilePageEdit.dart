import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/commonWidgets/btnWidget.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:select_dialog/select_dialog.dart';
import '../City.dart';
import '../Country.dart';
import '../webservice.dart';

class ProfilePageEdit extends StatefulWidget {
  const ProfilePageEdit({Key? key}) : super(key: key);

  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  DateTime selectedDate = DateTime.now();
  var dateText="Birth date";
  var selectedCountryUser = "Select your country";
  var selectedCityUser = "Select your city";
  var strNoFileChose = "No File chosen";
  var btnTextChooseFile = "Choose File";
  List<Data> countryList =[];
  List<DataCity> cityList =[];
  List<String> countryListData =[];
  List<String> cityListData =[];

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

    final SvgParser parser = SvgParser();
    try {
      parser.parse("image asset", warningsAsErrors: true);
      print('SVG is supported');
    } catch (e) {
      print('SVG contains unsupported features');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffacb4ff),

        appBar:CommonAppBar(
          appBar: AppBar(),
          title: txtEditProfile,
          textColor: Colors.white,
          isDrawer: true,
          isLeading: true,
          AppBarBackground: colorPurple,
        ),

        body:
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: 10.h,left: 5.h,right: 5.h),
            child: userTab(),
          ),
        )
    );


  }

  Widget userTab()
  {
    var picked;

    return Padding(

      padding: EdgeInsets.all(8.h),

      child: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.center,
                child: Text(txtEditdetaillHere,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtName,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  context: context,
                  lableText:txtName ,
                  txtController: _nameControllerU,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtSurname,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  context: context,
                  lableText:txtSurname ,
                  txtController: _surnameControllerU,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtBirthDate,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                InkWell(
                    onTap: (){
                      _selectDate(context);
                    },
                    child:
                    getTextWidgetDate()
                    ),


                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtEmail,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  context: context,
                  lableText:txtEmail ,
                  txtController: _emailControllerU,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtCountry,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                InkWell(
                    onTap: (){
                      String ex1 = selectedCountryUser;

                      SelectDialog.showModal<String>(
                        context,
                        label: txtSelectYourCountry,
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
                    child:
                    getTextWidget(selectedCountryUser,)
                ),


                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtCity,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),


                InkWell(
                    onTap: () {
                      String ex1 = selectedCityUser;

                      SelectDialog.showModal<String>(
                        context,
                        label: txtSelectYourCity,
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

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtHouseNumber,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  context: context,
                  lableText:txtHouseNumber ,
                  txtController: _numOfHouseControllerU,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtStreet,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  context: context,
                  lableText:txtStreet ,
                  txtController: _streetControllerU,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtNeighbourhood,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  context: context,
                  lableText:txtNeighbourhood ,
                  txtController: _neighborhoodControllerU,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtPostCode,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  context: context,
                  lableText:txtPostCode ,
                  txtController: _postCodeControllerU,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtPhnNumber,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),


                CommonEditTextWidget(
                  context: context,
                  lableText:txtPhnNumber ,
                  txtController: _phoneNumControllerU,
                  textInputType: TextInputType.text,
                  obsecureText: true,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),


                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtUploadId,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 15.h),
              child: Row(
                children: [
                  ElevatedButton(onPressed: () async {
                    picked = await FilePicker.platform.pickFiles();

                    if (picked == null){
                      CircularProgressIndicator();
                    } else {
                      print(picked.files.first.name != null && picked.files.first.name != ""?picked.files.first.name:"");

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

            SizedBox(height:8.h),

            Center(
              child: BtnWidget((){
                validationForUserTab();
              }, btnText: txtSave),
            ),
          ],
        ),
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
                left: 16.w, right: 16.w,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.r)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)]),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(strText,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp),))
                ),
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
                left: 16.w, right: 16.w,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.r)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)]),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(dateText,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp),))
        ),
      ],
    );
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
            String message =result[txtMessage];
            showSnackBar(context, message);
          }
          return result as City;
        }
    );
  }
  showSnackBar(BuildContext context, String message) {

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
    } else if (!isPhoneNoValid(_emailControllerU!.text)){
      showSnackBar(context, "Phone number is not valid");
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

    } else if (_confPassControllerU!.text.isEmpty){
      showSnackBar(context, "confirm password is empty");
      return;
    } else if (_passControllerU!.text != _confPassControllerU!.text){
      showSnackBar(context, "password is not same");
      return;
    }
    else{
      Future.delayed(Duration.zero, () {
        getProgress();
      });
      showSnackBar(context, txtSubmit);
    }

  }

  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }
}

