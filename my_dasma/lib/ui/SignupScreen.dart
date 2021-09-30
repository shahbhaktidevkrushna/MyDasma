import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_dasma/Country.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/commonWidgets/CommonErrorText.dart';
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
  var txtBirthdayHint = "Birthday";
  var picked;

  var selectedCountryUser = "Select your country";

  // var selectedCityUser = "Select your city";
  var selectedCountryBusiness = "Select your country";

//  var selectedCityBusiness = "Select your city";

  var btnTextChooseFile = "Choose File";
  var dateText = "Birth date";
  List<Data> countryList = [];
  List<DataCity> cityList = [];
  List<String> countryListData = [];
  List<String> cityListData = [];

  FocusNode nameFocus = FocusNode();
  FocusNode surnameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode numFocus = FocusNode();
  FocusNode housenumberFocus = FocusNode();
  FocusNode streetFocus = FocusNode();
  FocusNode neighbourhoodFocus = FocusNode();
  FocusNode postcodeFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmpasswordFocus = FocusNode();


  FocusNode bbnameFocus = FocusNode();
  FocusNode bnameFocus = FocusNode();
  FocusNode bsurnameFocus = FocusNode();
  FocusNode bemailFocus = FocusNode();
  FocusNode bnumFocus = FocusNode();
  FocusNode bhousenumberFocus = FocusNode();
  FocusNode bstreetFocus = FocusNode();
  FocusNode bneighbourhoodFocus = FocusNode();
  FocusNode bpostcodeFocus = FocusNode();
  FocusNode bpasswordFocus = FocusNode();
  FocusNode bconfirmpasswordFocus = FocusNode();

  late SignupProvider signupProviderRead;
  late SignupProvider signupProviderWatch;

  TextEditingController _bNameControllerB = TextEditingController();
  TextEditingController _typeBControllerB = TextEditingController();
  TextEditingController _nameControllerB = TextEditingController();
  TextEditingController _surNameControllerB = TextEditingController();
  TextEditingController _emailControllerB = TextEditingController();
  TextEditingController _phoneNumControllerB = TextEditingController();
  TextEditingController _passControllerB = TextEditingController();
  TextEditingController _confPassControllerB = TextEditingController();
  TextEditingController _sCountryControllerB = TextEditingController();
  TextEditingController _sCityControllerB = TextEditingController();
  TextEditingController _numHouseControllerB = TextEditingController();
  TextEditingController _streetControllerB = TextEditingController();
  TextEditingController _neighborhoodControllerB = TextEditingController();
  TextEditingController _postCodeControllerB = TextEditingController();

  TextEditingController _nameControllerU = TextEditingController();
  TextEditingController _surnameControllerU = TextEditingController();
  TextEditingController _birthdayControllerU = TextEditingController();
  TextEditingController _emailControllerU = TextEditingController();
  TextEditingController _phoneNumControllerU = TextEditingController();
  TextEditingController _sCountryControllerU = TextEditingController();
  TextEditingController _sCityControllerU = TextEditingController();
  TextEditingController _numOfHouseControllerU = TextEditingController();
  TextEditingController _streetControllerU = TextEditingController();
  TextEditingController _neighborhoodControllerU = TextEditingController();
  TextEditingController _postCodeControllerU = TextEditingController();
  TextEditingController _passControllerU = TextEditingController();
  TextEditingController _confPassControllerU = TextEditingController();

  String txtBirthday = "Birthday";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: signupProviderWatch.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != signupProviderWatch.selectedDate)
      signupProviderWatch.setSelecteDate(picked);
    dateText = "${signupProviderWatch.selectedDate.toLocal()}".split(' ')[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      signupProviderRead = context.read<SignupProvider>();
      nameFocus.addListener(() {
        signupProviderWatch.checkName(_nameControllerU.text);
      });
      surnameFocus.addListener(() {
        signupProviderWatch.checkSurName(_surnameControllerU.text);
      });
      emailFocus.addListener(() {
        signupProviderWatch.checkEmail(_emailControllerU.text);
      });
      numFocus.addListener(() {
        signupProviderWatch.checkNum(_phoneNumControllerU.text);
      });
      housenumberFocus.addListener(() {
        signupProviderWatch.checkHouseNumber(_numOfHouseControllerU.text);
      });
      streetFocus.addListener(() {
        signupProviderWatch.checkStreet(_streetControllerU.text);
      });
      neighbourhoodFocus.addListener(() {
        signupProviderWatch.checkNeighbourhood(_neighborhoodControllerU.text);
      });
      postcodeFocus.addListener(() {
        signupProviderWatch.checkPostCode(_postCodeControllerU.text);
      });
      passwordFocus.addListener(() {
        signupProviderWatch.checkPassword(_passControllerU.text);
      });
      confirmpasswordFocus.addListener(() {
        signupProviderWatch.checkConfirmPassword(_confPassControllerU.text);
      });


      bbnameFocus.addListener(() {
        signupProviderWatch.checkbBName(_bNameControllerB.text);
      });
      bnameFocus.addListener(() {
        signupProviderWatch.checkBName(_nameControllerB.text);
      });
      bsurnameFocus.addListener(() {
        signupProviderWatch.checkBSurName(_surNameControllerB.text);
      });
      bemailFocus.addListener(() {
        signupProviderWatch.checkBEmail(_emailControllerB.text);
      });
      bnumFocus.addListener(() {
        signupProviderWatch.checkBNum(_phoneNumControllerB.text);
      });
      bpasswordFocus.addListener(() {
        signupProviderWatch.checkBPassword(_passControllerB.text);
      });
      bconfirmpasswordFocus.addListener(() {
        signupProviderWatch.checkBConfirmPassword(_confPassControllerB.text);
      });
      bhousenumberFocus.addListener(() {
        signupProviderWatch.checkBHouseNumber(_numHouseControllerB.text);
      });
      bstreetFocus.addListener(() {
        signupProviderWatch.checkBStreet(_streetControllerB.text);
      });
      bneighbourhoodFocus.addListener(() {
        signupProviderWatch.checkBNeighbourhood(_neighborhoodControllerB.text);
      });
      bpostcodeFocus.addListener(() {
        signupProviderWatch.checkBPostCode(_postCodeControllerB.text);
      });
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
    signupProviderWatch = context.watch<SignupProvider>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 16.w),
                child: Text(txtSignUp,
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: Color(0xff6E0CDB),
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0.h),
                child: Column(children: [
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
                    },
                  ),
                ]),
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 16.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      signupProviderWatch.tabIndex == 0
                          ? userTab()
                          : businessTab(),
                      BtnWidget(() {
                        if (signupProviderWatch.tabIndex == 0) {
                          Future.delayed(Duration.zero, () {
                            getProgress(context);
                          });
                          fetchUserRegister();
                        } else {
                          fetchBusinessRegister();
                          Future.delayed(Duration.zero, () {
                            getProgress(context);
                          });
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
                    Text(
                      txtSignIn,
                      style: TextStyle(color: colorPurple),
                    ),
                    SizedBox(height: 64.h),
                  ],
                ),
                onTap: () {
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

  Widget getTextWidget(String strText) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 38.h,
            padding:
                EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w, bottom: 4.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.r)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)]),
            child: Align(alignment: Alignment.centerLeft, child: Text(strText))
            ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }

  Widget getTextWidgetDate() {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 38.h,
            padding:
                EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w, bottom: 4.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)]),
            child: Align(alignment: Alignment.centerLeft, child: Text(dateText))
            ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }

  Widget userTab() {
    var picked;

    return Column(
      children: [
        CommonEditTextWidget(
          context: context,
          lableText: txtName,
          txtController: _nameControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: nameFocus,
          onChanged: (value) {
            signupProviderWatch.checkName(_nameControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errNameMsg,visible:signupProviderWatch.isNameErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtSurname,
          txtController: _surnameControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: surnameFocus,
          onChanged: (value) {
            signupProviderWatch.checkSurName(_surnameControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errSurNameMsg,visible:signupProviderWatch.isSurNameErr ,),
        InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: getTextWidgetDate()),
        CommonEditTextWidget(
          context: context,
          lableText: txtEmail,
          txtController: _emailControllerU,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          focuNode: emailFocus,
          onChanged: (value) {
            signupProviderWatch.checkEmail(_emailControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errEmailMsg,visible:signupProviderWatch.isEmailErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtPhnNumber,
          txtController: _phoneNumControllerU,
          textInputType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          focuNode: numFocus,

          onChanged: (value) {
            signupProviderWatch.checkNum(_phoneNumControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errNumMsg,visible:signupProviderWatch.isNumErr ,),
        InkWell(
            onTap: () {
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
                  signupProviderWatch.setStateViseCountry(
                      signupProviderWatch.selectedCityUser);
                  for (var i = 0; i < countryList.length; i++) {
                    if (selectedCountryUser == countryList[i].title) {
                      Future.delayed(Duration.zero, () {
                        getProgress(context);
                      });
                      fetchCity(countryList[i].id);
                    }
                  }
                },
              );
            },
            child: getTextWidget(selectedCountryUser)),
        SizedBox(height: 5.h),
        InkWell(
            onTap: () {
              signupProviderWatch
                  .setStateViseCountry(signupProviderWatch.selectedCityUser);

              SelectDialog.showModal<String>(
                context,
                label: "Select your city",
                selectedValue: signupProviderWatch.state,
                items: cityListData,
                onChange: (String selected) {
                  signupProviderWatch.setStateViseCountry(selected);
                  signupProviderWatch.setCityHint(signupProviderWatch.state);
                },
              );
            },
            child: getTextWidget(signupProviderWatch.selectedCityUser)),
        SizedBox(height: 5.h),
        CommonEditTextWidget(
          context: context,
          lableText: txtHouseNumber,
          txtController: _numOfHouseControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: housenumberFocus,
          onChanged: (value) {
            signupProviderWatch.checkHouseNumber(_numOfHouseControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errHouseNumberMsg,visible:signupProviderWatch.isHouseNumberErr ,),

        CommonEditTextWidget(
          context: context,
          lableText: txtStreet,
          txtController: _streetControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: streetFocus,
          onChanged: (value) {
            signupProviderWatch.checkStreet(_streetControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errStreetMsg,visible:signupProviderWatch.isStreetErr ,),

        CommonEditTextWidget(
          context: context,
          lableText: txtNeighbourhood,
          txtController: _neighborhoodControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: neighbourhoodFocus,
          onChanged: (value) {
            signupProviderWatch.checkNeighbourhood(_neighborhoodControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errNeighbourhoodMsg,visible:signupProviderWatch.isNeighbourhoodErr ,),

        CommonEditTextWidget(
          context: context,
          lableText: txtPostCode,
          txtController: _postCodeControllerU,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          focuNode: postcodeFocus,
          onChanged: (value) {
            signupProviderWatch.checkPostCode(_postCodeControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errPostCodeMsg,visible:signupProviderWatch.isPostCodeErr ,),

        CommonEditTextWidget(
          context: context,
          lableText: txtPassword,
          txtController: _passControllerU,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,
          focuNode: passwordFocus,
          onChanged: (value) {
            signupProviderWatch.checkPassword(_passControllerU.text);
          },
        ),
        Padding(
          padding:  EdgeInsets.only(left:32.h,top: 4.h),
          child: Container(
              height: 42.h,
              child: Align(
                alignment: Alignment.topLeft,
                child:signupProviderWatch.isPasswordErr
                    ? Text(
                  signupProviderWatch.errPasswordMsg,
                  style: TextStyle(color: Colors.red),
                )
                    : Container(),
              )),
        ),
        CommonEditTextWidget(
          context: context,
          lableText: txtConfirmPassword,
          txtController: _confPassControllerU,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,
          focuNode: confirmpasswordFocus,
          onChanged: (value) {
            signupProviderWatch.checkConfirmPassword(_confPassControllerU.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errConfirmPasswordMsg,visible:signupProviderWatch.isConfirmPasswordErr ,),


        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 32.w, bottom: 10.0.h),
            child: Text(
              txtUploadId,
              style: TextStyle(fontSize: 14.sp),
            )),

        Container(
          margin: EdgeInsets.only(left: 32.0.w, bottom: 16.0.h),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  picked = await FilePicker.platform.pickFiles();

                  if (picked == null) {
                    Center(child: CircularProgressIndicator());
                  } else {
                    print(picked.files.first.name != null &&
                            picked.files.first.name != ""
                        ? picked.files.first.name
                        : "");
                    signupProviderWatch.setFile(picked.files.first.name);
                  }
                },
                child: Text(
                  btnTextChooseFile,
                  style: TextStyle(color: Colors.black54),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(signupProviderWatch.strNoFileChose,
                    style: TextStyle(fontSize: 14.sp)),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget businessTab() {
    return Column(
      children: [
        CommonEditTextWidget(
          context: context,
          lableText: txtBusinessName,
          txtController: _bNameControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: bbnameFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errbBNameMsg,visible:signupProviderWatch.isbBNameErr ,),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 38.h,
          padding:
              EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w, bottom: 4.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)]),
          child: DropdownButton(
            hint: signupProviderWatch.businessType == null
                ? Text('Dropdown')
                : Text(
                    "" + signupProviderWatch.businessType.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
            isExpanded: true,
            iconSize: 30.0.r,
            underline: Container(),
            style: TextStyle(color: Colors.black),
            items: [
              txtSinger,
              txtRestaurant,
              txtCameraMan,
              txtPhotographer,
              txtCameraManAndPhotographer,
              txtDJ,
              txtDancers,
              txtDecor,
              txtHairdressersAndMakeupArtists
            ].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              signupProviderWatch.setBusinessType(val.toString());
              _typeBControllerB.text = val.toString();
            },
          ),
        ),
        SizedBox(height: 16.h),
        CommonEditTextWidget(
          context: context,
          lableText: txtName,
          txtController: _nameControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: bnameFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBNameMsg,visible:signupProviderWatch.isBNameErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtSurname,
          txtController: _surNameControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: bsurnameFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBSurNameMsg,visible:signupProviderWatch.isBSurNameErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtEmail,
          txtController: _emailControllerB,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          focuNode: bemailFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBEmailMsg,visible:signupProviderWatch.isBEmailErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtPhnNumber,
          txtController: _phoneNumControllerB,
          textInputType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          focuNode: bnumFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBNumMsg,visible:signupProviderWatch.isBNumErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtPassword,
          txtController: _passControllerB,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,
          focuNode: bpasswordFocus,
          onChanged: (value) {
            signupProviderWatch.checkBPassword(_passControllerB.text);
          },
        ),
        Padding(
          padding:  EdgeInsets.only(left:32.h,top: 4.h),
          child: Container(
              height: 42.h,
              child: Align(
                alignment: Alignment.topLeft,
                child:signupProviderWatch.isBPasswordErr
                    ? Text(
                  signupProviderWatch.errBPasswordMsg,
                  style: TextStyle(color: Colors.red),
                )
                    : Container(),
              )),
        ),

        CommonEditTextWidget(
          context: context,
          lableText: txtConfirmPassword,
          txtController: _confPassControllerB,
          textInputType: TextInputType.text,
          obsecureText: true,
          textInputAction: TextInputAction.next,
          focuNode: bconfirmpasswordFocus,
          onChanged: (value) {
            signupProviderWatch.checkBConfirmPassword(_confPassControllerB.text);
          },
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBConfirmPasswordMsg,visible:signupProviderWatch.isBConfirmPasswordErr,),
        InkWell(
            onTap: () {
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
                  signupProviderWatch.setBusinessState(
                      signupProviderWatch.selectedCityBusiness);
                  for (var i = 0; i < countryList.length; i++) {
                    if (selectedCountryBusiness == countryList[i].title) {
                      Future.delayed(Duration.zero, () {
                        getProgress(context);
                      });
                      fetchCity(countryList[i].id);
                    }
                  }
                },
              );
            },
            child: getTextWidget(selectedCountryBusiness)),
        SizedBox(height: 5.h),
        InkWell(
            onTap: () {
              signupProviderWatch
                  .setBusinessState(signupProviderWatch.selectedCityBusiness);
              SelectDialog.showModal<String>(
                context,
                label: signupProviderWatch.selectedCityBusiness,
                selectedValue: signupProviderWatch.businessState,
                items: cityListData,
                onChange: (String selected) {
                  signupProviderWatch.setBusinessState(selected);
                  signupProviderWatch
                      .setBusinessCityHint(signupProviderWatch.businessState);
                },
              );
            },
            child: getTextWidget(signupProviderWatch.selectedCityBusiness)),
        SizedBox(height: 5.h),
        CommonEditTextWidget(
          context: context,
          lableText: txtHouseNumber,
          txtController: _numHouseControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: bhousenumberFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBHouseNumberMsg,visible:signupProviderWatch.isBHouseNumberErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtStreet,
          txtController: _streetControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: bstreetFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBStreetMsg,visible:signupProviderWatch.isBStreetErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtNeighbourhood,
          txtController: _neighborhoodControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: bneighbourhoodFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBNeighbourhoodMsg,visible:signupProviderWatch.isBNeighbourhoodErr ,),
        CommonEditTextWidget(
          context: context,
          lableText: txtPostCode,
          txtController: _postCodeControllerB,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focuNode: bpostcodeFocus,
        ),
        CommonErrorText(context:context ,errMsg: signupProviderWatch.errBPostCodeMsg,visible:signupProviderWatch.isBPostCodeErr ,),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 32.0.w, top: 16.0.h, bottom: 4.0.h),
            child: Text(
              "Upload document",
              style: TextStyle(fontSize: 14.sp),
            )),
        Container(
          margin: EdgeInsets.only(left: 32.0.w, bottom: 16.0.h),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  picked = await FilePicker.platform.pickFiles();

                  if (picked == null) {
                    Center(child: CircularProgressIndicator());
                  } else {
                    print(picked.files.first.name != null &&
                            picked.files.first.name != ""
                        ? picked.files.first.name
                        : "");
                    signupProviderWatch.setFile(picked.files.first.name);
                  }
                },
                child: Text(
                  "Choose File",
                  style: TextStyle(color: Colors.black54),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(signupProviderWatch.strNoFileChose,
                    style: TextStyle(fontSize: 14.sp)),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<bool> getReadFilePermission() async {
    if (await Permission.storage.request().isGranted) {
      print("Read permission granted");
      return true;
    } else {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.storage].request();
      print(statuses[Permission.storage]);
      return false;
    }
  }

  void validationForUserTab() {
    if (_nameControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyName);
      return;
    } else if (_surnameControllerU.text.isEmpty) {
      showSnackBar(context, errEmptySurname);
      return;
    } else if (dateText == "Birth date") {
      showSnackBar(context, errSelectYourBirthdate);
      return;
    } else if (_emailControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyEmail);
      return;
    } else if (!isEmail(_emailControllerU.text)) {
      showSnackBar(context, errNotValidEmail);
      return;
    } else if (_phoneNumControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyPhoneNumber);
      return;
    } else if (selectedCountryUser == "Select your country") {
      showSnackBar(context, errSelectCountry);
      return;
    } else if (signupProviderWatch.selectedCityUser == "Select your city") {
      showSnackBar(context, errSelectCity);
      return;
    } else if (_numOfHouseControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyHouseNo);
      return;
    } else if (_streetControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyStreet);
      return;
    } else if (_neighborhoodControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyNeighbourhood);
      return;
    } else if (_postCodeControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyPostCode);
      return;
    } else if (_passControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyPassword);
      return;
    } else if (!validatePassword(_passControllerU.text)) {
      showSnackBar(context, errPasswordNotValid);
      return;
    } else if (_confPassControllerU.text.isEmpty) {
      showSnackBar(context, errEmptyConfirmPass);
      return;
    } else if (_passControllerU.text != _confPassControllerU.text) {
      showSnackBar(context, errNotMatchConfirmPass);
      return;
    }
    /*else if (btnTextChooseFile == "Choose File"){
      showSnackBar(context, "please choose file");
      return;
    }*/
    else {
      Future.delayed(Duration.zero, () {
        getProgress(context);
      });
      fetchUserRegister();
    }
  }

  void validationForBusinessTab() {
    if (_bNameControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyBusinessName);
      return;
    } else if (_typeBControllerB.text.isEmpty) {
      showSnackBar(context, errTypeBusinessEmpty);
      return;
    } else if (_nameControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyName);
      return;
    } else if (_surNameControllerB.text.isEmpty) {
      showSnackBar(context, errEmptySurname);
      return;
    } else if (_emailControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyEmail);
      return;
    } else if (!isEmail(_emailControllerB.text)) {
      showSnackBar(context, errNotValidEmail);
      return;
    } else if (_phoneNumControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyPhoneNumber);
      return;
    }
    /*else if (isPhoneNoValid(_phoneNumControllerB!.text)){
      showSnackBar(context, "Phone number is not valid");
      return;
    }*/
    else if (_passControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyPassword);
      return;
    }
    /*else if (!validatePassword(_passwordControllerB!.text)){
      showSnackBar(context, "Password is not valid");
      return;
    }*/
    else if (_confPassControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyConfirmPass);
      return;
    } else if (_passControllerB.text != _confPassControllerB.text) {
      showSnackBar(context, errNotMatchConfirmPass);
      return;
    } else if (selectedCountryBusiness == "Select your country") {
      showSnackBar(context, errSelectCountry);
      return;
    } else if (signupProviderWatch.selectedCityBusiness == "Select your city") {
      showSnackBar(context, errSelectCity);
      return;
    } else if (_numHouseControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyHouseNo);
      return;
    } else if (_streetControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyStreet);
      return;
    } else if (_neighborhoodControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyNeighbourhood);
      return;
    } else if (_postCodeControllerB.text.isEmpty) {
      showSnackBar(context, errEmptyPostCode);
      return;
    }
    /*else if (strNoFileChose == "No File chosen"){
      showSnackBar(context, "please choose file");
      return;
    } */
    else {
      fetchBusinessRegister();
      Future.delayed(Duration.zero, () {
        getProgress(context);
      });
    }
  }

  fetchUserRegister() async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["name"] = _nameControllerU.text;
    map["surname"] = _surnameControllerU.text;
    map["phoneno"] = _phoneNumControllerU.text;
    map["dob"] = dateText;
    map["email"] = _emailControllerU.text;
    map["country"] = _sCountryControllerU.text;
    map["city"] = _sCityControllerU.text;
    map["house"] = _numOfHouseControllerU.text;
    map["street"] = _streetControllerU.text;
    map["suburb"] = _neighborhoodControllerU.text;
    map["postcode"] = _postCodeControllerU.text;
    map["password"] = _passControllerU.text;

    Webservice().loadPost(getHomeNews, map).then(
          (model) => {},
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          } else {
            String message = result["message"];
            showSnackBar(context, message);
          }
          return result;
        });
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
          (model) => {},
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
            signupProviderWatch
                .setCountryObject(Country.fromJson(json.decode(response.body)));
            countryList.addAll(signupProviderWatch.cc.datalist);
            for (var i = 0; i < countryList.length; i++) {
              countryListData.add(countryList[i].title);
            }
          } else {
            String message = result["message"];
            showSnackBar(context, message);
          }
          return result as Country;
        });
  }

  fetchCity(String id) async {
    print("city api call:" + id);
    Map<String, dynamic> map = Map<String, dynamic>();
    map["c_id"] = id;

    Webservice().loadPost(getCity, map).then(
          (model) => {},
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
            signupProviderWatch
                .setCityObject(City.fromJson(json.decode(response.body)));
            cityList.clear();
            cityListData.clear();
            cityList.addAll(signupProviderWatch.cityObject.datalist);
            for (var i = 0; i < cityList.length; i++) {
              cityListData.add(cityList[i].title);
            }
          } else {
            String message = result["message"];
            showSnackBar(context, message);
          }
          return result as City;
        });
  }

  fetchBusinessRegister() async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["business_name"] = _bNameControllerB.text;
    map["business_type_id"] = "1";
    map["name"] = _nameControllerB.text;
    map["surname"] = _surNameControllerB.text;
    map["phoneno"] = _phoneNumControllerB.text;
    map["dob"] = dateText;
    map["email"] = _emailControllerB.text;
    map["country"] = _sCountryControllerB.text;
    map["city"] = _sCityControllerB.text;
    map["house"] = _numHouseControllerB.text;
    map["street"] = _streetControllerB.text;
    map["suburb"] = _neighborhoodControllerB.text;
    map["postcode"] = _postCodeControllerB.text;
    map["password"] = _passControllerB.text;

    Webservice().loadPost(getBusiness, map).then(
          (model) => {},
        );
  }

  Resource<User> get getBusiness {
    return Resource(
        url:
            "https://www.mydasma.com/mydasma_api/api/user/business_registration",
        parse: (response) {
          Navigator.pop(context);
          final result = json.decode(response.body);
          print("" + ".......getSupplierLogin......." + result.toString());
          bool success = result["status"];
          if (success) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          } else {
            String message = result["message"];
            showSnackBar(context, message);
          }
          return result;
        });
  }
}
