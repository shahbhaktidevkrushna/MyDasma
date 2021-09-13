import 'dart:io';
import 'dart:math' show pi;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessTextField.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/providers/CaregoryProvider.dart';
import 'package:my_dasma/ui/MediaSelection.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddServicePackage extends StatefulWidget {

  @override
  _AddServicePackageState createState() => _AddServicePackageState();
}

class _AddServicePackageState extends State<AddServicePackage> {
  String dropdownvalue = 'The name of the party';
  List<String> items =  ['The name of the party','Wedding','Konagjeqi','Engagement','Synetia','Birthday','Semi-ripe','Matura Exam','Concerts'];
  late CategoryProvider categoryProviderRead;
  late CategoryProvider categoryProviderWatch;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      categoryProviderRead=context.read<CategoryProvider>();
    });
  }
  @override
  Widget build(BuildContext context) {
    categoryProviderWatch=context.watch<CategoryProvider>();
    print('Started again');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: 'ADD THE SERVICE PACKAGE',
          AppBarBackground:Colors.black,
          isLeading: true,
          textColor: Colors.white,

        ),
        body: Container(

          child: SingleChildScrollView(

            child: Padding(

              padding: EdgeInsets.all(12.h),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("PACKAGE DETAIL",style: TextStyle(fontSize: 18.sp,color: Colors.grey,fontWeight: FontWeight.bold),),

                  SizedBox(height: 8.h,),

                  Text(txtSelectCategory,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),

                  SizedBox(height: 8.h,),

                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    child:DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isDense: true,
                        isExpanded: true,
                        items:items.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(items,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal),)
                          );
                        }
                        ).toList(),
                        onChanged: (value){
                          categoryProviderWatch.setCategory(value.toString());
                        },value : categoryProviderWatch.dropdownvalue
                      ),
                    ),) ,

                  SizedBox(height: 12.h,),

                  Text('Offer Details',style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),

                  SizedBox(height: 8.h,),

                  Text('CAMERAMAN: 1 camera + 1 crane-camera + 1 drone',style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.normal),),

                  Text('PHOTOGRAPHER: 1 camera (or more)',style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.normal),),

                  Text('CAMERA AND PHOTOGRAPH: 1 (2) camera + 1 (2) camera + 1 crane-camera + 1 drone',style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.normal),),

                  SizedBox(height: 12.h,),

                  Container(
                    child: TextField(
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black
                      ),
                      maxLines: 1,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          hintText: txtName,
                          isDense: true,
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.normal)
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h,),

                  Align(
                      alignment: Alignment. topCenter,
                      child: Container(
                        child: CommonElevatedButton(
                          onTap: (){

                          },
                          context: context,
                          lableText: txtSubmit,
                          ButtonBackground: Colors.black,
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
