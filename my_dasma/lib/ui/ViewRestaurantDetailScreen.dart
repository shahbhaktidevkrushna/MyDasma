import 'dart:io';
import 'dart:math' show pi;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ViewRestaurantDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: "Look At The Restaurant",
          AppBarBackground:Colors.black,
          isLeading: true,
          // isDrawer: true,
          textColor: Colors.white,

        ),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(left:6.h,top: 10.h,right: 6.h ,bottom: 6.h ),
                child: Padding(
                  padding:  EdgeInsets.only(left:6.h,top: 10.h,right: 6.h ,bottom: 20.h ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Details of the Restaurant",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Card(
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding:  EdgeInsets.only(top: 8.0,bottom: 8.0,left: 10.h,right: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name of Restaurant ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,

                                ),
                              ),

                      SizedBox(height: 5.h,),
                      Text(
                          "Hotel Green Plaza",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),
                      Divider(
                          color: Colors.grey,
                          thickness: 1.h,),
                      SizedBox(height: 5.h,),
                      Text(
                          "Minimum Allowed People",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                          "120",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),
                      Divider(
                          color: Colors.grey,
                          thickness: 1.h,),
                      SizedBox(height: 5.h,),
                      Text(
                          "Maximum Allowed People",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                          "500",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),
                      Divider(
                          color: Colors.grey,
                          thickness: 1.h,),
                      SizedBox(height: 5.h,),
                      Text(
                          "Created",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                          "2021-09-03 18:19:37",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Divider(
                          color: Colors.grey,
                          thickness: 1.h,),
                      SizedBox(height: 5.h,),

                      Text(
                          "Width",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                          "-33.8689358",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Divider(
                          color: Colors.grey,
                          thickness: 1.h,),
                      SizedBox(height: 5.h,),

                      Text(
                          "Length",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                          "151.2066116",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Divider(
                          color: Colors.grey,
                          thickness: 1.h,),
                      SizedBox(height: 5.h,),

                      Text(
                          "State",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                          "Inactive (passive)",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                      ),
                      SizedBox(height: 5.h,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),color: Colors.white,width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
          ),
      ),
    );
  }
}
