
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/cupertino.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Function? onPress;
  final bool? isLeading;
  final bool? isDrawer;
  final List<Widget>? action;
  final AppBar? appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  CommonAppBar(
      {this.title,
        this.subtitle,
        this.onPress,
        @required this.appBar,
        this.isLeading = true,
        this.isDrawer = false,
        this.action,
        this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.light,
      leading: isLeading == true
          ? IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          })
          : Offstage(),
      elevation: 0,
      actions: action,
      backgroundColor:Colors.white,
      title: Text(
        (title ?? "").toUpperCase(),
        style: TextStyle(
            color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar!.preferredSize.height);
}
