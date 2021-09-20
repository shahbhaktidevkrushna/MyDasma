
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';

class BlogScreen extends StatefulWidget {

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: txtBlog,
          AppBarBackground:colorPurple,
          isLeading: false,
          // isDrawer: true,
          textColor: Colors.white,

        ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[


                            ],
                          ),
                      )


                ),
              ),
            ),
          );

  }
}
