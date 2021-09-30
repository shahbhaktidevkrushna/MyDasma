import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_dasma/ui/BlogScreen.dart';
import 'package:my_dasma/ui/BusinessDashboard.dart';
import 'package:my_dasma/ui/ProfileScreen.dart';
import 'package:my_dasma/ui/SigninScreen.dart';

import 'package:my_dasma/ui/BusinessProfilePage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SigninScreen.dart';


class BusinessDrawer extends StatefulWidget {
  final List<MenuItem> mainMenu;
  final Function(int)? callback;
  final int? current;

  BusinessDrawer(
    this.mainMenu, {
    Key? key,
    this.callback,
    this.current,
  });

  @override
  _BusinessDrawerState createState() => _BusinessDrawerState();
}

class _BusinessDrawerState extends State<BusinessDrawer> {
  final widthBox = SizedBox(
    width: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    final TextStyle androidStyle =  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white);
    final TextStyle iosStyle = const TextStyle(color: Colors.white);
    final style = kIsWeb
        ? androidStyle
        : Platform.isAndroid
            ? androidStyle
            : iosStyle;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Theme.of(context).primaryColor,
              Colors.black,
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: ()
                {

                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => BusinessProfilePage()));
                  Provider.of<BusinessMenuProvider>(context, listen: false).updateCurrentPage(6);
                  ZoomDrawer.of(context)!.toggle();

                },
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 24.h, left: 24.h, right: 24.h),
                  child: Container(
                    width: 80.h,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 36.h, left: 24.h, right: 24.h),
                child: Text(
                  tr("name"),
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Selector<BusinessMenuProvider, int>(
                selector: (_, provider) => provider.currentPage,
                builder: (_, index, __) => Padding(
                  padding:  EdgeInsets.only(bottom: 36.h, left: 24.h, right: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...widget.mainMenu
                          .map((item) => MenuItemWidget(
                                key: Key(item.index.toString()),
                                item: item,
                                callback: widget.callback,
                                widthBox: widthBox,
                                style: style,
                                selected: index == item.index,
                              ))
                          .toList()
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding:  EdgeInsets.only(left: 24.h, right: 24.h),
                child: OutlinedButton(
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      tr("logout"),
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white, width: 2.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem? item;
  final Widget? widthBox;
  final TextStyle? style;
  final Function? callback;
  final bool? selected;

  final white = Colors.white;

  const MenuItemWidget({
    Key? key,
    this.item,
    this.widthBox,
    this.style,
    this.callback,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback!(item!.index),
      style: TextButton.styleFrom(
        primary: selected! ? Color(0x44000000) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            item!.icon,
            color: white,
            size: 24,
          ),
          widthBox!,
          Expanded(
            child: Text(
              item!.title,
              style: style,
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final int index;

  const MenuItem(this.title, this.icon, this.index);
}
