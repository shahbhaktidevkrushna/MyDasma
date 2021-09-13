import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/ui/ProfilePageEdit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
       title: txtProfile,
        action: [Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          IconButton(
                icon: Icon(Icons.edit,color: Colors.white,size: 22,),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfilePageEdit()));
                },
              ),
        )],
        textColor: Colors.white,
        isDrawer: true,
        isLeading: false,
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
    return Padding(
      padding: EdgeInsets.all(8.h),

        child: Center(

          child: Column(
            children: [
              Align(alignment: Alignment.center,
                  child: Text(txtNotedetaillHere,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(txtName,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                  ),

                  CommonEditTextWidget(
                    enabled: false,
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
                    enabled: false,
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

                  CommonEditTextWidget(
                    enabled: false,
                    context: context,
                    lableText:txtBirthDate ,
                    txtController: _birthdayControllerU,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,),

                  SizedBox(height:8.h),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(txtEmail,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                  ),

                  CommonEditTextWidget(
                    enabled: false,
                    context: context,
                    lableText:txtEmail ,
                    txtController: _emailControllerU,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,),

                  SizedBox(height:8.h),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(txtHouseNumber,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                  ),

                  CommonEditTextWidget(
                    enabled: false,
                    context: context,
                    lableText:txtCountry ,
                    txtController: _sCountryControllerU,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,),

                  SizedBox(height:8.h),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(txtCity,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                  ),

                  CommonEditTextWidget(
                    enabled: false,
                    context: context,
                    lableText:txtCity,
                    txtController: _sCityControllerU,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,),

                  SizedBox(height:8.h),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(txtHouseNumber,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                  ),

                  CommonEditTextWidget(
                    enabled: false,
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
                    enabled: false,
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
                    enabled: false,
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
                    enabled: false,
                    context: context,
                    lableText:txtPostCode ,
                    txtController: _postCodeControllerU,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,),

                  SizedBox(height:8.h),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(txtPassword,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                  ),


                  CommonEditTextWidget(
                    enabled: false,
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

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Image.asset(photoIcon,height: 50.h,width: 50.h,color:colorPurple,),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}


