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


class AddRestaurantScreen1 extends StatefulWidget {

  @override
  _AddRestaurantScreen1State createState() => _AddRestaurantScreen1State();
}

class _AddRestaurantScreen1State extends State<AddRestaurantScreen1> {
  bool? valuefirst = false;
  bool? valuesecond = false;

  var locationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: "Add Restaurants",
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
                    Text("General Data",style: TextStyle(fontSize: 18.sp,color: Colors.grey,fontWeight: FontWeight.w500),),
                    SizedBox(height: 8.h,),
                    Text("Select categories",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                 InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.all(10),
                  ),
                    child:DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: "Male",
                        isDense: true,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(child: Text("Select Gender"), value: ""),
                          DropdownMenuItem(child: Text("Male"), value: "Male"),
                          DropdownMenuItem(child: Text("Female"), value: "Female"),
                        ],
                        onChanged: (newValue) {
                          setState(() {
                          });
                        },
                      ),
                    ),) ,
                    SizedBox(height: 8.h,),
                    Text("Select services",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      child:DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: "Male",
                          isDense: true,
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(child: Text("Select Gender"), value: ""),
                            DropdownMenuItem(child: Text("Male"), value: "Male"),
                            DropdownMenuItem(child: Text("Female"), value: "Female"),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                            });
                          },
                        ),
                      ),),
                    SizedBox(height: 8.h,),
                    Text("Feactures",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    ListView.builder(
                      itemCount: 3,

                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return Container(

                          child:   Container(
                            height: 25.h,
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.all(0),
                              activeColor: Colors.black,
                              title: const Text('Car Parking'),
                              value: this.valuefirst,
                              onChanged: (value) {
                                setState(() {
                                  this.valuefirst = value;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12.h,),
                    Text("Location",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 12.h,),
                    CommonBusinessTextField(context: context, hintText: "Location", maxLine: 2, controller: locationController,),

                    SizedBox(height: 30.h,),

                    Align(
                      alignment: Alignment. topRight,
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            tooltip: 'Open New Page',
                            onPressed: ()
                                {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MediaSelection()));
                                },
                            child: new Icon(Icons.navigate_next,size: 30,),),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment. topRight,
                    //   child: CommonElevatedButton(
                    //     lableText: "Next",
                    //     context: context,
                    //     ButtonBackground: Colors.black,
                    //     onTap: ()
                    //     {
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (context) => MediaSelection()));
                    //     },
                    //   ),
                    // )

                    // Text("Minimum Allowed People",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    // SizedBox(height: 8.h,),
                    // Container(
                    //   height: 37.h,
                    //   child: TextField(
                    //     decoration: new InputDecoration(
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    //       ),
                    //       //hintText: 'Mobile Number',
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 8.h,),
                    // Text("Maximum Allowed People",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                    // SizedBox(height: 8.h,),
                    // Container(
                    //   height: 37.h,
                    //   child: TextField(
                    //     decoration: new InputDecoration(
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    //       ),
                    //       //hintText: 'Mobile Number',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }
}
