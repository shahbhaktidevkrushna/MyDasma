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
import 'package:my_dasma/ui/AddRestaurant1.dart';
import 'package:my_dasma/ui/CategoryDetailListPage.dart';
import 'package:my_dasma/ui/ViewDetailScreen.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BusinessHomeScreen extends StatefulWidget {


  @override
  _BusinessHomeScreenState createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  bool status = false;

  final List<CategoryList> categoryList= <CategoryList>[
    CategoryList(gradiant_back_image, catRest),
    CategoryList(gradiant_back_image, catSinger),
    CategoryList(gradiant_back_image, catCameraman),
    CategoryList(gradiant_back_image, catPhotographer),
    CategoryList(gradiant_back_image, catCameraPhotographer),
    CategoryList(gradiant_back_image, catDecoration),
    CategoryList(gradiant_back_image, catMakeup),
    CategoryList(gradiant_back_image, catDJ),
    CategoryList(gradiant_back_image, catDancer),
    ];

  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
         backgroundColor: Colors.white                      ,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: txtHome,
          AppBarBackground:Colors.black,
          isLeading: false,
          // isDrawer: true,
          textColor: Colors.white,

        ),

        body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
            alignment: Alignment.center,
            color: Colors.white,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                Text("List Of Restaurants",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20.sp),),
                SizedBox(height: 10.h,),
                Text("Please note that all parts must be completed before your business becomes public. If you can not add all the details at once, be sure to press the Send button, or you will lose everything you have written / added. Video is optional.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 14.sp),),
                SizedBox(height: 10.h,),
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
              lableText: "Add Restaurnat",
              ButtonBackground: Colors.black,
              onTap: ()
              {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddRestaurantScreen1()));
              },
            )
          ),
        ) ,
      ),
    );
  }

  Widget restList()
  {
    return Card(
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
                 Text("Name of Rest.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
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
                  Text("Created : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                  Text("2021-09-03 18:19:37",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 14.sp),),

                ],
              ),
              SizedBox(height: 3.h,),
              Row(

                children: [
                  Text("Modified : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
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
                            builder: (context) => ViewDetailScreen()));
                      },
                      context: context,
                      lableText: "View",
                      ButtonBackground: Colors.black,
                    )
                  ),
                  SizedBox(width: 10.h,),
                  Container(
                    height: 25.h,

                    child: CommonElevatedButton(
                      context: context,
                      lableText: "Edit",
                      ButtonBackground: Colors.black,
                    )
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
class CategoryList {
  final String image;
  final String title;
  CategoryList(this.image,this.title );
  
  
}
