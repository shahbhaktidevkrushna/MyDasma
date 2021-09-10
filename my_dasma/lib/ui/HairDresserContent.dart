import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';



class HairDresserContent extends StatefulWidget {
  @override
  _HairDresserContentState createState() => _HairDresserContentState();
}
TextEditingController? _HistoryController = TextEditingController();
TextEditingController? _AddressController = TextEditingController();
TextEditingController? _PriceController = TextEditingController();

class _HairDresserContentState extends State<HairDresserContent> with Constant{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CommonAppBar(
            appBar: AppBar(),
            title: txtContent,
            AppBarBackground:Colors.black,
            isLeading: true,
            textColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(txtPrice,style: TextStyle(fontSize: 16.sp,color:Colors.black,fontWeight: FontWeight.bold),),
                  Text(txtNote, style: TextStyle(fontSize: 16.sp,color:Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.h,),
                  Container(
                    child: TextField(
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black
                      ),
                      controller: _AddressController,
                      maxLines: 1,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          hintText: txtHintPrice,
                          isDense: true,
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.normal)
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h,),
                  Text(txtBusinessHistory,style: TextStyle(fontSize: 16.sp,color:Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.h,),
                  Container(
                    child: TextField(
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black
                      ), controller: _HistoryController,
                      maxLines: 8,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          hintText: txtHistory,
                          isDense: true,

                          hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.normal)
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h,),
                  Text(txtAddress,style: TextStyle(fontSize: 16.sp,color:Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.h,),
                  Container(
                    child: TextField(
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black
                      ),
                      controller: _AddressController,
                      maxLines: 8,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          hintText: txtAddress,
                          isDense: true,
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.normal)
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h,),
                  Align(
                      alignment: Alignment. topCenter,
                      child: Container(
                        child: CommonElevatedButton(
                          onTap: (){
                            validationForUserTab();
                          },
                          context: context,
                          lableText: txtSubmit,
                          ButtonBackground: Colors.black,
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  void validationForUserTab() {
    if (_HistoryController!.text.isEmpty) {
      showSnackBar(context, errEmptyHistory);
    }
    else if (_AddressController!.text.isEmpty) {
      showSnackBar(context, errEmptyAddress);
    }
    else{
      showSnackBar(context, txtSubmit);
    }
  }
}
