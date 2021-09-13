import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessTextField.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:my_dasma/extras/constants/Constant.dart';


class SingerContentScreen extends StatefulWidget {
  SingerContentScreen({Key? key}) : super(key: key);

  @override
  _SingerContentScreenState createState() => _SingerContentScreenState();
}

class _SingerContentScreenState extends State<SingerContentScreen> {

  var biographySController = TextEditingController();
  var addressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CommonAppBar(
            appBar: AppBar(),
            AppBarBackground:Colors.black,
            isLeading: true,
            // isDrawer: true,
          ),

          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16.0.w, right: 16.0.w),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  SizedBox(height: 32.h,),

                  Text(txtBiographyOfSinger,
                      style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8.h,),

                 CommonBusinessTextField(
                     context: context,
                     hintText: txtBiographyOfSinger,
                     controller: biographySController,
                     maxLine: 4),

                  SizedBox(height: 8.h,),

                  Text(txtAddress,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8.h,),

                  CommonBusinessTextField(
                      context: context,
                      hintText: txtAddress,
                      controller: addressController,
                      maxLine: 1),

                  SizedBox(height: 30.h,),

                  Center(
                    child: CommonElevatedButton(
                        onTap: checkEmptyField,
                        context: context,
                        lableText: txtSubmit,),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }

  checkEmptyField(){
    if (biographySController.text.isEmpty){
      return;
    }

    else if (addressController.text.isEmpty){
      return;
    }
  }
}
