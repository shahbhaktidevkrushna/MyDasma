import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PageStructure extends StatelessWidget {
  final String? title;
  final Widget? child;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;

  const PageStructure({
    Key? key,
    this.title,
    this.child,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CommonAppBar(
        appBar: AppBar(),
        title: txtHome,
        AppBarBackground:colorPurple,
        isLeading: false,
        // isDrawer: true,
        textColor: Colors.white,

      ),

      body:SafeArea(
        child:  Container(
          alignment: Alignment.center,
          color: Colors.white,
          child:
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){


              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink.image(image: AssetImage(listViewImage3),
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
        ),
      ),
    );
  }
}
