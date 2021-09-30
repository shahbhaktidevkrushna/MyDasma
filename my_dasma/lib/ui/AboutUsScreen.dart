import 'dart:io';
import 'dart:math' show pi;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/SharePrefConstant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AboutUsScreen extends StatelessWidget {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(

        appBar: CommonAppBar(
          appBar: AppBar(),
          title: txtAboutUs,
          AppBarBackground:storage.read(loginType)=="User"?colorPurple:Colors.black,
          isLeading: false,
          //isDrawer: true,
          textColor: Colors.white,

        ),

        body:SafeArea(
          child:  Container(
              alignment: Alignment.center,
              color: Colors.white,
              child:
              Image.asset(comingsoon,height: 120.h,width: 300.h,)
            // Text("${tr("current")}: ${HomeScreen.mainMenu[_currentPage].title}"),
          ),

        ),
      ),
    );
  }
}
