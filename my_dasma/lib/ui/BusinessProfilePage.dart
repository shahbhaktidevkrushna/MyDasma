import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';


class BusinessProfilePage extends StatefulWidget {
  const BusinessProfilePage({Key? key}) : super(key: key);


  @override
  _BusinessProfilePageState createState() => _BusinessProfilePageState();
}

class _BusinessProfilePageState extends State<BusinessProfilePage> {

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
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
    return SafeArea(
      child: Scaffold(

          appBar:CommonAppBar(
            appBar: AppBar(),
            scaffoldKey: scaffoldKey,
            context: context,
            title: txtProfile,
            action: [Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              IconButton(
                icon: Icon(Icons.edit,color: Colors.white,size: 22,),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BusinessProfilePageEdit()));
                },
              ),
            )],
            textColor: Colors.white,
            isLeading: false,
            AppBarBackground: blackDark,
          ),

          body:
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: 10.h,left: 5.h,right: 5.h),
              child: BusinessTab(),
            ),
          )
      ),
    );
  }

  Widget BusinessTab()
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
                  child: Text(txtBusinessName,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  enabled: false,
                  context: context,
                  lableText:txtBusinessName ,
                  txtController: _bNameControllerB,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtBusinessCategory,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  enabled: false,
                  context: context,
                  lableText:txtBusinessCategory ,
                  txtController: _typeBControllerB,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtName,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  enabled: false,
                  context: context,
                  lableText:txtName ,
                  txtController: _nameControllerB,
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
                  txtController: _surNameControllerB,
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
                  txtController: _emailControllerB,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtPhnNumber,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  enabled: false,
                  context: context,
                  lableText:txtPhnNumber ,
                  txtController: _phoneNumControllerB,
                  textInputType: TextInputType.text,
                  obsecureText: true,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtCountry,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                CommonEditTextWidget(
                  enabled: false,
                  context: context,
                  lableText:txtCountry ,
                  txtController: _sCountryControllerB,
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
                  txtController: _sCityControllerB,
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
                  txtController:  _numHouseControllerB,
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
                  txtController: _streetControllerB,
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
                  txtController: _neighborhoodControllerB,
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
                  txtController: _postCodeControllerB,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,),

                SizedBox(height:8.h),


                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(txtUploadId,style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Image.asset(photoIcon,height: 50.h,width: 50.h,color:blackDark,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


