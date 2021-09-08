import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

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
       title: "Profile",
        textColor: Colors.white,
        isDrawer: true,
        isLeading: false,
        AppBarBackground: colorPurple,

      ),

      // AppBar(
      //   elevation: 0.0.r,
      //   backgroundColor: Color(0xffe7e9f4),
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: Color(0xff6E0CDB),
      //       )),
      //
      //
      //
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: Icon(Icons.edit, color: Color(0xff6E0CDB))),
      //
      //     /* ElevatedButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       child: Icon(Icons.edit),
      //       style: ButtonStyle(
      //         shape: MaterialStateProperty.all(CircleBorder()),
      //         padding: MaterialStateProperty.all(EdgeInsets.all(12.0)),
      //         backgroundColor: MaterialStateProperty.all(Colors.transparent), // <-- Button color
      //         overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
      //           if (states.contains(MaterialState.pressed)) return Color(0xffacb4ff); // <-- Splash color
      //         }),
      //       ),
      //     ),*/
      //   ],
      // ),

      body:
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: 10.h,left: 5.h,right: 5.h),
            child: userTab(),
          ),
        )
      // SingleChildScrollView(
      //  // color: Color(0xffe7e9f4),
      //   //color: Colors.amber,
      //   child: Stack(
      //     clipBehavior: Clip.none,
      //     fit: StackFit.loose,
      //     children: [
      //       Container(
      //       color: Color(0xffe7e9f4),
      //       // color:Colors.red,
      //         child: Container(
      //
      //           height: MediaQuery.of(context).size.height/1.2,
      //
      //           margin: EdgeInsets.only(top: 100.h),
      //           decoration: BoxDecoration(
      //               color: Color(0xfffafafa),
      //               // color: Colors.green,
      //               //color: Colors.red,
      //               borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(30.0.r),
      //                 topRight: Radius.circular(30.0.r),
      //               )),
      //         ),
      //       ),
      //       Positioned(
      //         top: 60.0.h,
      //         left: 0.0.w,
      //         right: 0.0.w,
      //         child: Container(
      //           width: 80.w,
      //           height: 80.h,
      //          // child: Image.asset("assets/profile.png"),
      //           child: Icon(Icons.account_circle, size: 80.r, color: Color(0xff6E0CDB),),
      //         ),
      //       ),
      //       Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //               margin:
      //                   EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 160.0.h),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     "Rahul Solanki", style:
      //                         TextStyle(color: Color(0xff000000), fontSize: 20.sp),),
      //                   Text(
      //                     "User", style: TextStyle(fontSize: 18.sp),
      //                   ),
      //
      //                   SizedBox(height: 20.h),
      //
      //                   Align(
      //                       alignment: Alignment.topLeft,
      //                       child: Text(
      //                         "About you",
      //                         style: TextStyle(
      //                             color: Color(0xff000000), fontSize: 16.sp),
      //                       )),
      //                   getCommonSections("Email Address",
      //                       "rahulsolankidevkrushna@gmail.com", "email.svg"),
      //                   getCommonSections(
      //                       "Phone number",
      //                       "9898989898",
      //                       "phone_number.svg"),
      //                   getCommonSections("Address",
      //                       "San fransisco", "location.svg"),
      //
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );

    /*return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffea5d49),
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // image: DecorationImage(
                    //   image: AssetImage(null),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );*/

    /*return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),

                Positioned(
                  top: -50.0,

                    child: Icon(Icons.account_circle, size: 50, color: Colors.grey,)),
              ],
            ),
          ),
        ],
      ),
    );*/

    /*return Scaffold(
      backgroundColor: Color(0xffacb4ff),

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffacb4ff),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.edit)),
        ],
      ),

      body: Column(
       mainAxisSize: MainAxisSize.max,

        children: [
          */ /*Container(
            height: 100,
              child: Text("Hello")),*/ /*
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.only(left: 0.0, right: 0.0),
                    shape: RoundedRectangleBorder(),
                      child: Text("Hello Flutter")),
                ),
              ],
            ),
          )
        ],
      ),
    );*/
  }

  Widget getCommonSections(String title, String desc, String image) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffe7e9f4),
          borderRadius: BorderRadius.all(Radius.circular(16.0.r))),
      margin: EdgeInsets.only(top: 16.0.h),
      padding: EdgeInsets.all(16.0.r),
      child: Row(
        children: [
          //Image.asset("assets/"+image),
          SvgPicture.asset(
            'assets/' + image,
            height: 50.0.h,
            width: 100.0.w,
            allowDrawingOutsideViewBox: true,
            //colorBlendMode: ,
          ),

          SizedBox(width: 16.0.w),

          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Color(0xff000000), fontWeight: FontWeight.bold),),
                SizedBox(height: 4.h,),
                Text(desc),
              ],
            ),
          ),
        ],
      ),
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
        CommonEditTextWidget(
          context: context,
          lableText:"Birthdate" ,
          txtController: _surnameControllerU,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,),
        // InkWell(
        //     onTap: (){
        //       _selectDate(context);
        //     },
        //     child: getTextWidgetDate()),
        SizedBox(height:15.h),
        CommonEditTextWidget(
          context: context,
          lableText:txtEmail ,
          txtController: _emailControllerU,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,),

        SizedBox(height:15.h),

        // CommonEditTextWidget(
        //   context: context,
        //   lableText:txtPhnNumber ,
        //   txtController: _phoneNumControllerU,
        //   textInputType: TextInputType.phone,
        //   textInputAction: TextInputAction.next,),
        //
        // SizedBox(height:15.h),

        // InkWell(
        //     onTap: (){
        //       signupProviderWatch.setCountry(selectedCountryUser);
        //
        //       SelectDialog.showModal<String>(
        //         context,
        //         label: "Select your country",
        //         selectedValue: signupProviderWatch.country,
        //         items: countryListData,
        //         onChange: (String selected) {
        //           signupProviderWatch.setCountry(selected);
        //           selectedCountryUser = signupProviderWatch.country;
        //
        //           signupProviderWatch.setCityHint("Select your city");
        //           signupProviderWatch.setStateViseCountry(signupProviderWatch.selectedCityUser);
        //           // setState(() {
        //           //   selectedCityUser="Select your city";
        //           //   signupProviderWatch.setStateViseCountry(selectedCityUser);
        //           // });
        //
        //           for (var i = 0; i < countryList.length; i++) {
        //             if(selectedCountryUser==countryList[i].title)
        //             {
        //               Future.delayed(Duration.zero, () {
        //                 getProgress(context);
        //               });
        //               fetchCity(countryList[i].id);
        //             }
        //           }
        //           // setState(() {
        //           //   ex1 = selected;
        //           //   selectedCountryUser = ex1;
        //           //   for (var i = 0; i < countryList.length; i++) {
        //           //     if(selectedCountryUser==countryList[i].title)
        //           //       {
        //           //         Future.delayed(Duration.zero, () {
        //           //           getProgress(context);
        //           //         });
        //           //         fetchCity(countryList[i].id);
        //           //       }
        //           //   }
        //           //
        //           // });
        //         },
        //       );
        //
        //       // setState(() {
        //       //   selectedCountryUser = ex1;
        //       // });
        //     },
        //     child: getTextWidget(selectedCountryUser)),
        // SizedBox(height:5.h),
        // InkWell(
        //     onTap: () {
        //       signupProviderWatch.setStateViseCountry(signupProviderWatch.selectedCityUser);
        //
        //       SelectDialog.showModal<String>(
        //         context,
        //         label: "Select your city",
        //         selectedValue: signupProviderWatch.state,
        //         items: cityListData,
        //         onChange: (String selected) {
        //           signupProviderWatch.setStateViseCountry(selected);
        //           signupProviderWatch.setCityHint(signupProviderWatch.state);
        //           // setState(() {
        //           //   ex1 = selected;
        //           //   selectedCityUser = ex1;
        //           // });
        //         },
        //       );
        //
        //       // setState(() {
        //       //   selectedCityUser = ex1;
        //       // });
        //     },
        //
        //     child: getTextWidget(signupProviderWatch.selectedCityUser)),
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

        // Container(
        //   margin: EdgeInsets.only(left: 32.0.w, bottom: 16.0.h),
        //   child: Row(
        //     children: [
        //       ElevatedButton(onPressed: () async {
        //         picked = await FilePicker.platform.pickFiles();
        //
        //         if (picked == null){
        //           Center(child: CircularProgressIndicator());
        //         } else {
        //           print(picked.files.first.name != null && picked.files.first.name != ""?picked.files.first.name:"");
        //           //Text(picked.files.first.name, style: TextStyle(fontSize: 14));
        //           signupProviderWatch.setFile(picked.files.first.name);
        //
        //         }
        //
        //       }, child: Text(btnTextChooseFile,
        //         style: TextStyle(color: Colors.black54),), style: ElevatedButton.styleFrom(
        //           primary: Colors.white),
        //
        //       ),
        //       Padding(
        //         padding: EdgeInsets.all(8.0.r),
        //         child: Text(signupProviderWatch.strNoFileChose, style: TextStyle(fontSize: 14.sp)),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffea5d49);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
