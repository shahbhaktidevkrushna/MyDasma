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


class BlogScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CommonAppBar(
        appBar: AppBar(),
        title: txtBlog,
        AppBarBackground:colorPurple,
        isLeading: false,
        // isDrawer: true,
        textColor: Colors.white,

      ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(left:6.h,top: 6.h,right: 6.h ,bottom: 6.h ),
              child: Card(
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding:  EdgeInsets.only(left:6.h,top: 6.h,right: 6.h ,bottom: 6.h ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: Expanded(

                          child: SingleChildScrollView(
                            child: Center(
                              child: Text(
                                "LOOK AT THE RESTAURANT ",
                                style: TextStyle(
                                  color: colorPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),textAlign: TextAlign.center,
                              ),
                            ),padding: EdgeInsets.only(bottom: 10.h ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: Expanded(

                          child: SingleChildScrollView(

                            child: Text(
                              "Name of Restaurant ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: Expanded(

                          child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "Hotel Green Plaza",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.h,),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            child: Text(
                              "Minimum Allowed People",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "120",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.h,),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            child: Text(
                              "Maximum Allowed People",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "500",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.h,),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            child: Text(
                              "Created",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "2021-09-03 18:19:37",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.h,),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            child: Text(
                              "Width",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "-33.8689358",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.h,),
                      Container(
                        padding: const EdgeInsets.all(3.0),

                        child: Expanded(

                          child: SingleChildScrollView(

                            child: Text(
                              "Length",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: Expanded(

                          child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "151.2066116",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.h,),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: Expanded(

                          child: SingleChildScrollView(

                            child: Text(
                              "State",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        child: Expanded(

                          child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "Inactive (passive)",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),color: Colors.white,width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
        ),
    );
  }
}
