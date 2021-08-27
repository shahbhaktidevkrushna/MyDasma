import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';


class CategoryDetailListDetailPage extends StatefulWidget {

   String restName="";
  // CategoryDetailListDetailPage(this.restName);

   CategoryDetailListDetailPage({Key? key,required this.restName}) : super(key: key);

  @override
  _CategoryDetailListDetailPageState createState() => _CategoryDetailListDetailPageState();
}

class _CategoryDetailListDetailPageState extends State<CategoryDetailListDetailPage>  with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:CommonAppBar(appBar: AppBar(),isLeading: true,textColor: Colors.white,title:widget.restName ,AppBarBackground: colorPurple,),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(catDetailImage2, height: 150.h,width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,),
              ),
              SizedBox(height: 10.h,),
              Text(widget.restName,style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),),

              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.w),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: colorPurple,

                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 5.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      //color: secondary,
                      size: 12,
                    ),
                    SizedBox(
                      width: 2,
                    ),

                    Expanded(
                      child: Container(
                        child: Text(txtCatListSubTitle4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              //color: primary,
                                fontSize: 14.sp, letterSpacing: .3)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Text("Restaurant info.",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorPurple,
                        border: Border.all(width: 1, color: colorPurple)
                    ),
                  ),
                  SizedBox(width: 6.h,),
                  Text(txtMinPeople+": 120",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorPurple,
                        border: Border.all(width: 1, color: colorPurple)
                    ),
                  ),
                  SizedBox(width: 6.h,),
                  Text(txtMaxPeople+" : 450",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),
            

            //Image.asset(userdata),
            //   DefaultTabController(length: 2, child: Column(
            //     children: [
            //       TabBar(
            //           isScrollable: true,
            //           tabs:[
            //
            //             Tab(text:"description" ,),
            //             Tab(text:"Food packages" ,),
            //             // Tab(text:"Equipment" ,),
            //
            //           ],controller: _tabController,
            //       ),
            //
            //       TabBarView(
            //         controller: _tabController,
            //         children: [
            //           Icon(Icons.flight, size: 350),
            //           Icon(Icons.directions_transit, size: 350),
            //           // Icon(Icons.directions_car, size: 350),
            //         ],
            //       ),
            //     ],
            //   ))


            ],
          ),
        )
      ),
    );
  }
}
