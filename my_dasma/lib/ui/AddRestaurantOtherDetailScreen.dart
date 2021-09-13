import 'dart:io';
import 'dart:math' show pi;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessTextField.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/ui/MediaSelection.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddRestaurantOtherDetailScreen extends StatefulWidget {

  @override
  _AddRestaurantOtherDetailScreenState createState() => _AddRestaurantOtherDetailScreenState();
}

class _AddRestaurantOtherDetailScreenState extends State<AddRestaurantOtherDetailScreen> {
  bool? valuefirst = false;
  bool? valuesecond = false;


  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title:txtOtherRestaurantDetail,
          AppBarBackground:Colors.black,
          isLeading: true,
          // isDrawer: true,
          textColor: Colors.white,

        ),
          body: Container(

            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(txtRestaurantName,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    CommonBusinessTextField(context: context, hintText: txtRestaurantName, maxLine:1 ),
                    SizedBox(height: 8.h,),
                    Text(txtMinimumAllowPeople,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    CommonBusinessTextField(context: context, hintText: txtMinimumAllowPeople, maxLine:1 ),
                    SizedBox(height: 8.h,),
                    Text(txtMaximumAllowPeople,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    CommonBusinessTextField(context: context, hintText: txtMaximumAllowPeople, maxLine:1 ),
                    SizedBox(height: 8.h,),
                    Text(txtState,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      child:DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: "Select State",
                          isDense: true,
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(child: Text("Select State"), value: "Select State"),
                            DropdownMenuItem(child: Text("Inactive(Passive)"), value: "Inactive(Passive)"),
                            DropdownMenuItem(child: Text("Accepted"), value: "Accepted"),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                            });
                          },
                        ),
                      ),),
                    SizedBox(height: 8.h,),
                    Text(txtDetailsOfRestaurant,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    CommonBusinessTextField(context: context, hintText: txtDetailsOfRestaurant, maxLine:8 ),
                    SizedBox(height: 8.h,),

                    Text(txtRestaurantAddress,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    CommonBusinessTextField(context: context, hintText: txtRestaurantAddress, maxLine:4 ),
                    SizedBox(height: 10.h,),
                    Center(child: CommonElevatedButton(context: context, lableText: txtSubmit,ButtonBackground: Colors.black,onTap:(){
                       Navigator.pop(context);
                  }))




                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }
}
