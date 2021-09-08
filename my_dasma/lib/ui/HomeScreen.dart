import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/ui/CategoryDetailListPage.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {


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
            itemCount: categoryList.length,
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
                      Ink.image(image: AssetImage(categoryList[index].image),
                        height: 100.h,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),

                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CategoryDetailListPage(isFrom: categoryList[index].title,)));
                          },
                        ),),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.0.w)
                              ,child: Text(categoryList[index].title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
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
class CategoryList {
  final String image;
  final String title;
  CategoryList(this.image,this.title );
}
