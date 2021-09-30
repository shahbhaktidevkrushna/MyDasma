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
import 'package:my_dasma/ui/AddRestaurantBasicDetailScreen.dart';
import 'package:my_dasma/ui/CategoryDetailListScreen.dart';
import 'package:my_dasma/ui/RestaurantMenuScreen.dart';
import 'package:my_dasma/ui/ViewRestaurantDetailScreen.dart';
import 'package:provider/provider.dart';
import 'RestaurantListScreen.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessHomeScreenOtherCategory extends StatefulWidget {
  @override
  _BusinessHomeScreenOtherCategoryState createState() => _BusinessHomeScreenOtherCategoryState();
}

class _BusinessHomeScreenOtherCategoryState extends State<BusinessHomeScreenOtherCategory> {
  bool status = false;
  final List<DashboardData> dashboardList = <DashboardData>[
    DashboardData(bed_icon, "MANAGE THE DETAIL",
        "You can manage your details from here"),

  ];
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),scaffoldKey: scaffoldKey,

          title: txtHome,
          AppBarBackground: Colors.black,
          isLeading: false,
          // isDrawer: true,
          textColor: Colors.white,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10.h, left: 10.h, right: 10.h),
          color: Colors.white,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: dashboardList.length,
            itemBuilder: (context, index) {
              return restList(dashboardList[index], index);
            },
          ),
        ),

      ),
    );
  }

  Widget restList(DashboardData item, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddRestaurantBasicDetailSceeen()));
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: Image.asset(
                          item.image,
                          height: 30.h,
                          width: 30.h,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    item.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 15.h,
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

class DashboardData {
  final String image;
  final String title;
  final String description;

  DashboardData(this.image, this.title, this.description);
}
