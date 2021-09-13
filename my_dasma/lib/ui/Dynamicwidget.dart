import 'dart:io';
import 'dart:math' show pi;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessTextField.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class dynamicWidget extends StatelessWidget {


  Function() onPress;
  dynamicWidget({required this.onPress});
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListBody(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(child: CommonBusinessTextField(context: context, hintText: "Name", maxLine: 1)),
                SizedBox(width: 10.h,),
                Container(
                    width: 25.h,
                    height: 25.h,
                    child:GestureDetector(
                        onTap:onPress,
                        //   (){
                        //
                        // setState(() {
                        //   print("minus clicked");
                        //   print("position:"+widget.index.toString());
                        //    widget.dynamicList.removeAt(widget.index);
                        //
                        // });
                        // },
                        child: Container(
                            child: Image.asset(minus_icon)))
                ),
              ],
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ],
    );
  }
}


