import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/ui/CategoryDetailListDetailScreen.dart';
import 'package:my_dasma/ui/UserDashboard.dart';


class CategoryDetailListScreen extends StatefulWidget {

  final String isFrom;

  const CategoryDetailListScreen({Key? key,required this.isFrom}) : super(key: key);

  @override
  _CategoryDetailListScreenState createState() => _CategoryDetailListScreenState();
}

class _CategoryDetailListScreenState extends State<CategoryDetailListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: CommonAppBar(appBar: AppBar(),title: "All "+widget.isFrom,isLeading: true,AppBarBackground: colorPurple,textColor: Colors.white,),

        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return Wrap(
              children: [

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),

                   // color: Colors.black12,
                  ),
                 // width: double.infinity,
                 // height: 130.h,
                 // height: double.maxFinite,
                  //margin: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 0.0.h),
                  margin: EdgeInsets.only(left: 16.0.w, top: 12.0.h, right: 16.0.w, bottom: 0.0.h),
                  //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  //padding: EdgeInsets.only(top: 8.0.h, bottom: 16.0.h),
                  child: Column(

                    children: [

                      SizedBox(height: 2.0.h,),

                     /* Align(
                        alignment: Alignment.topLeft,
                        child: Text(txtAllRest, style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),),
                      ),

                      SizedBox(height: 12.0.h,),*/

                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryDetailListDetailScreen(restName: txtCatListTitle,isFrom: widget.isFrom,)));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Container(

                                child: Image.asset(catDetailImage2, fit: BoxFit.cover ,width: 100.w, height: 120.h,)),

                            SizedBox(width: 10.w,),

                            Expanded(
                              child: Container(
                                //color: Colors.green,
                                //alignment: Alignment.topCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      //details[index]['name'],
                                      txtCatListTitle,
                                      style: TextStyle(
                                          //color: ,
                                          fontWeight: FontWeight.bold, fontSize: 16.sp, color: colorPurple),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),

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

                                    SizedBox(
                                      height: 4,
                                    ),

                                    Row(
                                      children: <Widget>[
                                        /*Icon(
                                          Icons.location_on,
                                          //color: secondary,
                                          size: 20,
                                        ),*/
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(txtCatListSubTitle1,
                                            style: TextStyle(
                                                //color: primary,
                                                fontSize: 13)),
                                      ],
                                    ),
                                    /*SizedBox(
                                      height: 6,
                                    ),*/
                                    Visibility(
                                      visible:widget.isFrom==catRest,
                                      child: Row(
                                        children: <Widget>[
                                          /*Icon(
                                            Icons.location_on,
                                            //color: secondary,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),*/
                                          Text(txtCatListSubTitle2,
                                              style: TextStyle(
                                                  //color: primary,
                                                  fontSize: 13, letterSpacing: .3)),
                                        ],
                                      ),
                                    ),

                                    widget.isFrom==catRest?SizedBox(height: 4.h,):SizedBox(),

                                    Visibility(
                                      visible:widget.isFrom==catRest,
                                      child: Row(
                                        children: [
                                          Text(txtCatListSubTitle3,
                                              style: TextStyle(
                                                //color: primary,
                                                  fontSize: 13, letterSpacing: .3)),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 4.h,),

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
                                                      fontSize: 13, letterSpacing: .3)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4.h,),
                                    widget.isFrom != catRest?Text("Description",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),):SizedBox(),
                                    widget.isFrom != catRest ? SizedBox(
                                      height: 5,
                                    ):SizedBox(),
                                    widget.isFrom != catRest?Text("Hello! To all of you dear ones who have known me for decades and who have sung my song and me to entertain you through your family celebrations and joys, I want to thank you, from the bottom of my heart! I, always, have felt very good with you and on",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(color: Colors.black,fontSize: 10.sp,fontWeight: FontWeight.normal),):SizedBox()
                                  ],
                                ),
                              ),
                            ),

                            //SizedBox(height: 4.h,)
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Divider(
                        color: Colors.grey,
                        thickness: 1.h,),

                     // SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ],
            );
          },
         // padding: EdgeInsets.all(0.0),
        ),

      ),
    );
  }
}
