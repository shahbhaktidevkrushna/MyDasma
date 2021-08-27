import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(appBar: AppBar(),
        isLeading: false, isDrawer: true, title: txtHome,),

        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){
            /*return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              // padding: EdgeInsets.only(left: 16.0.w, top: 16.0.h, right: 8.0.w, bottom: 8.0.h),
              margin: EdgeInsets.only(left: 26.0.w, top: 8.0.h, right: 26.0.w, bottom: 8.0.h),

              child:Stack(
                children: [
                  // Image.asset(listViewImage,width: MediaQuery.of(context).size.width,height: 100.h,),
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.asset(
                                listViewImage,
                                // width: 300,
                                height: 150,
                                fit:BoxFit.fitWidth

                            ),
                          ),
                          Column(
                           // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(txtTitle),
                              SizedBox(height: 8.0.h,),
                              Text(txtDesc)
                            ],
                          )
                        ],
                      ),


                    ],
                  ),
                ],
              )
            );*/


            return Container(
              margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 22.w),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Ink.image(image: AssetImage(catDetailImage2),
                    height: 100.h,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),

                    child: InkWell(
                      onTap: (){

                      },
                    ),),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.0.w)
                              ,child: Text(txtCatName, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                            alignment: Alignment.center,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      ),
    ));
  }
}
