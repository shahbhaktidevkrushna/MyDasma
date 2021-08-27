import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/ui/AboutUs.dart';
import 'package:my_dasma/ui/BlogScreen.dart';
import 'package:my_dasma/ui/ContactUs.dart';
import 'package:my_dasma/ui/MediaScreen.dart';
import 'package:my_dasma/ui/MediaVideoListPage.dart';
import 'package:my_dasma/ui/PrivacyPolicy.dart';
import 'package:my_dasma/ui/page_structure.dart';
import 'package:provider/provider.dart';

import 'menu_page.dart';

class HomeScreen extends StatefulWidget {
  static List<MenuItem> mainMenu = [
    MenuItem(tr(txtHome), Icons.payment, 0),
    MenuItem(tr(txtMedia), Icons.card_giftcard, 1),
    MenuItem(tr(txtBlog), Icons.notifications, 2),
    MenuItem(tr(txtContactUs), Icons.help, 3),
    MenuItem(tr(txtAboutUs), Icons.info_outline, 4),
     MenuItem(tr(txtPrivacyPolicy), Icons.info_outline, 5),
  ];

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final isRtl = context.locale.languageCode == "ar";

    return ZoomDrawer(

      controller: _drawerController,
      style: DrawerStyle.Style1,

      menuScreen: MenuScreen(
        HomeScreen.mainMenu,
        callback: _updatePage,
        current: _currentPage,
      ),
       mainScreen: MainScreen(index: getPage(),),
      // mainScreen: MainScreen(),
      borderRadius: 24.0,
//      showShadow: true,
      angle: 0.0,
      mainScreenScale: .1,
      slideWidth: MediaQuery.of(context).size.width * (isRtl ? .55 : 0.65),
      isRtl: isRtl,
      clipMainScreen: false,
      // openCurve: Curves.fastOutSlowIn,
      // closeCurve: Curves.bounceIn,
    );
  }

  void _updatePage(index) {
    Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index);
    _drawerController.toggle!();
  }

  int getPage() {
    return Provider.of<MenuProvider>(context, listen: true)._currentPage;

  }
}

class MainScreen extends StatefulWidget {

  int? index=0;
  MainScreen({this.index});


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  @override
  Widget build(BuildContext context) {
      print("current index::"+Provider.of<MenuProvider>(context, listen: false)._currentPage.toString());
    final rtl = context.locale.languageCode == "ar";
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier!,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child:setScreen(widget.index),
        onPanUpdate: (details) {
          if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            ZoomDrawer.of(context)!.toggle();
            //Constant().showSnackBar(context, "clicked");
          }
        },
      ),
    );
  }

  Widget setScreen(int? index)
  {
    if(index==0) {
      return PageStructure();
      // return MediaVideoListPage();
    }

    else if(index==1)
    {
      return MediaScreen();
    }
    else if(index==2)
    {
      return BlogScreen();
    }
    else if(index==3)
    {
      return ContactUs();
    }
    else if(index==4)
    {
      return AboutUs();
    }
    else if(index==5)
    {
      return PrivacyPolicy();
    }
    else {
      return PageStructure();
    }
  }
}

class MenuProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {

    if (index != currentPage) {
      print("index::"+index.toString());
      _currentPage = index;
      notifyListeners();
    }
  }
}
