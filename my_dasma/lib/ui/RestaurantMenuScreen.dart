import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/ui/AddMenuScreen.dart';
import 'package:my_dasma/ui/AddRestaurantBasicDetailScreen.dart';
import 'package:my_dasma/ui/CategoryDetailListScreen.dart';
import 'package:my_dasma/ui/ViewMenuDetailScreen.dart';
import 'package:my_dasma/ui/ViewRestaurantDetailScreen.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RestaurantMenuScreen extends StatefulWidget {


  @override
  _RestaurantMenuScreenState createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  bool status = false;


  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
         backgroundColor: Colors.white                      ,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: txtManageRestaurantMenu,
          AppBarBackground:Colors.black,
          isLeading: true,
          // isDrawer: true,
          textColor: Colors.white,

        ),

        body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10.h,right: 10.h,left: 10.h),
            alignment: Alignment.center,
            color: Colors.white,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(txtRestMenu,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20.sp),),
              //  SizedBox(height: 10.h,),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount:3,
                  itemBuilder: (context, index){
                    return restList();
                  },
                ),
              ],
            )

          ),
        ),
        bottomNavigationBar: Padding(
          padding:  EdgeInsets.only(right: 25.w,left: 25.w,bottom: 10.h,top: 10.h),
          child: Container(
            height: 30.h,
           // width: MediaQuery.of(context).size.width/1.2,
            child: CommonElevatedButton(
              context: context,
              lableText: txtAddFoodMenu,
              ButtonBackground: Colors.black,
              onTap: ()
              {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddMenuSceeen()));
              },
            )
          ),
        ) ,
      ),
    );
  }

  Widget restList()
  {
    return Padding(
      padding:  EdgeInsets.only(top: 10.h),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(

                 children: [
                   Text(txtRestaurantName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                   Spacer(),
                   FlutterSwitch(
                     width: 80.0,
                     height: 35.0,
                     valueFontSize: 13.sp,
                     toggleSize: 30.0,
                     value: status,
                     borderRadius: 30.0,
                     padding: 8.0,
                     showOnOff: true,
                      activeColor: Colors.black,
                     onToggle: (val) {
                       setState(() {
                         status = val;
                       });
                     },
                   ),
                 ],
               ),
                Row(

                  children: [
                    Text(txtPrice,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                    Text("1.14",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 14.sp),),
                  ],
                ),
                SizedBox(height: 3.h,),
                Row(

                  children: [
                    Text(txtCreatedDate,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                    Text("2021-09-03 18:19:37",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 14.sp),),

                  ],
                ),
                SizedBox(height: 3.h,),
                Row(

                  children: [
                    Text(txtModifiedDate,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                    Text("2021-09-03 18:19:37",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 14.sp),),

                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25.h,

                      child:CommonElevatedButton(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewMenuDetailScreen()));
                        },
                        context: context,
                        lableText: txtView,
                        ButtonBackground: Colors.black,
                      )
                    ),
                    SizedBox(width: 10.h,),
                    Container(
                      height: 25.h,

                      child: CommonElevatedButton(
                        context: context,
                        lableText: txtEdit,
                        ButtonBackground: Colors.black,
                        onTap: (){

                        },
                      )
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
