
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Function? onPress;
  final bool? isLeading;
  final bool? isDrawer;
  final List<Widget>? action;
  final AppBar? appBar;
  final Color? AppBarBackground;
  final Color? textColor;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final angle =  0.0;


  CommonAppBar(
      {this.title,
        this.subtitle,
        this.onPress,
        @required this.appBar,
        this.isLeading = true,
        this.isDrawer = false,
        this.action,
        this.scaffoldKey,
        this.textColor,
       this.AppBarBackground});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      brightness: Brightness.light,
        leading: isLeading == true?IconButton(
              icon: Icon(Icons.arrow_back_ios, color:AppBarBackground != null ? Colors.white:Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }) :
        Transform.rotate(
            angle: angle,
            child: PlatformIconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
            ),
        ),
      // leading: isLeading == true
      //     ? IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     })
      //     : Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 25),
      //   child: Builder(
      //     builder: (context) => IconButton(
      //       icon: Image.asset(
      //         drawer,
      //         height: 15,
      //         width: 34,
      //       ),
      //       onPressed: () => Scaffold.of(context).openDrawer(),
      //     ),
      //   ),
      // ),

      elevation: 0,
      actions: action,
      backgroundColor:AppBarBackground != null ?AppBarBackground:Colors.white,
      title: Text(
        (title ?? "").toUpperCase(),
        style: TextStyle(
            color: textColor!= null ? textColor:Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar!.preferredSize.height);
}
