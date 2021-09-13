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


class ViewMenuDetailScreen extends StatefulWidget {

  @override
  _ViewMenuDetailScreenState createState() => _ViewMenuDetailScreenState();
}

class _ViewMenuDetailScreenState extends State<ViewMenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: txtLookAtMenu,
          AppBarBackground:Colors.black,
          isLeading: true,

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
                          txtMenuDetails,
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
                                txtRestaurantName,
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
                        txtMenuName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                          "dsadv dsadsa sadasd",
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
                        txtMenuPrice,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                          "€1.14",
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
                        txtCreated,
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
                        txtState,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                          "Accepted",
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
                        txtMenuComposition,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,

                          ),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                          "aaaaa \n bbbbb",
                          maxLines: 5,
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
