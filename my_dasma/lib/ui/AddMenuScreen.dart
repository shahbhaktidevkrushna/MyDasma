import 'dart:io';
import 'dart:math' show pi;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessTextField.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/ui/Dynamicwidget.dart';
import 'package:my_dasma/ui/MediaSelection.dart';
import 'package:provider/provider.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddMenuSceeen extends StatefulWidget {

  @override
  _AddMenuSceeenState createState() => _AddMenuSceeenState();
}

class _AddMenuSceeenState extends State<AddMenuSceeen> {
  bool? valuefirst = false;
  bool? valuesecond = false;
  var imagePicker;
  var _image;
  String partyName=catRest;
  String restName="Emli Rrestaurant";
  String state="Inactive(passive)";


  List<dynamicWidget> dynamicList = [];
  List<String>Product = [];
  final List<CategoryList> categoryList= <CategoryList>[
    CategoryList(catRest),
    CategoryList(catSinger),
    CategoryList(catCameraman),
    CategoryList(catPhotographer),
    CategoryList(catCameraPhotographer),
    CategoryList(catDecoration),
    CategoryList(catMakeup),
    CategoryList(catDJ),
    CategoryList(catDancer),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();

  }


  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: txtManageMenu,
          AppBarBackground:Colors.black,
          isLeading: true,

          textColor: Colors.white,

        ),
          body: Container(

            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text(txtAddFoodMenuC,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 8.h,),
                    Center(
                      child: _image!= null?Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(_image,fit: BoxFit.fill, height: 125.h,
                            width: 125.h,),
                        ),
                      )
                      :Image.asset(
                        no_image,
                        height: 125.h,
                        width: 125.h,
                      ),
                    ),

                    SizedBox(height: 3.h,),
                    Center(
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(primary: blackDark),
                          icon: Icon(
                            Icons.camera_alt,
                            size: 20.0.r,
                          ),
                          onPressed: () async {
                            _pickImage();

                          },
                          label: Text(txtSelectPhotos,
                              style: TextStyle(color: Colors.white, fontSize: 16.0))),
                    ),
                    SizedBox(height: 8.h,),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              border: Border.all(width: 1, color: Colors.black)
                          ),
                        ),
                        SizedBox(width: 6.h,),
                        Text("General Data",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding:  EdgeInsets.only(left: 12.h,right:12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Party Name",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                          SizedBox(height: 5.h,),
                          InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            child:DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: partyName,

                                isDense: true,
                                isExpanded: true,
                                items: [

                                  DropdownMenuItem(child: Text(catRest,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal),), value:catRest),
                                  DropdownMenuItem(child: Text(catSinger,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catSinger),
                                  DropdownMenuItem(child: Text(catCameraman,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catCameraman),
                                  DropdownMenuItem(child: Text(catPhotographer,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catPhotographer),
                                  DropdownMenuItem(child: Text(catCameraPhotographer,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catCameraPhotographer),
                                  DropdownMenuItem(child: Text(catDecoration,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catDecoration),
                                  DropdownMenuItem(child: Text(catMakeup,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catMakeup),
                                  DropdownMenuItem(child: Text(catDJ,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catDJ),
                                  DropdownMenuItem(child: Text(catDancer,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: catDancer),
                                ],
                                onChanged: (newValue) {
                                  setState(() {
                                    partyName=newValue.toString();
                                  });
                                },
                              ),
                            ),) ,
                          SizedBox(height: 5.h,),
                          Text("Price €",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                          SizedBox(height: 5.h,),
                          CommonBusinessTextField(context: context, hintText: "Price €", maxLine: 1),
                          SizedBox(height: 5.h,),
                          Text("Select restaurant",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                          SizedBox(height: 5.h,),
                          InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            child:DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: restName,

                                isDense: true,
                                isExpanded: true,
                                items: [

                                  DropdownMenuItem(child: Text("Emli Rrestaurant",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal),), value:"Emli Rrestaurant"),
                                  DropdownMenuItem(child: Text("Green plaza restaurant",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: "Green plaza restaurant"),
                                  DropdownMenuItem(child: Text("Applewood restaurant",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: "Applewood restaurant"),

                                ],
                                onChanged: (newValue) {
                                  setState(() {
                                    restName=newValue.toString();
                                  });
                                },
                              ),
                            ),) ,
                          SizedBox(height: 5.h,),
                          Text(txtState,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                          SizedBox(height: 5.h,),
                          InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            child:DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: state,

                                isDense: true,
                                isExpanded: true,
                                items: [

                                  DropdownMenuItem(child: Text("Accepted",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal),), value:"Accepted"),
                                  DropdownMenuItem(child: Text("Inactive(passive)",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal)), value: "Inactive(passive)"),


                                ],
                                onChanged: (newValue) {
                                  setState(() {
                                    state=newValue.toString();
                                  });
                                },
                              ),
                            ),) ,
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 12.h,right:12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("MENU",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                          SizedBox(height: 6.h,),
                          dynamicList.length>0?ListView.builder(
                           itemCount: dynamicList.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (_, index) => dynamicList[index],
                      ):Container(),
                          SizedBox(height: 6.h,),
                          Divider(color: Colors.grey,height: 2.h,),
                          SizedBox(height: 6.h,),
                          GestureDetector(
                            onTap: ()
                            {
                              setState(() {
                                print("add button clicked");
                                addDynamic();
                              });
                            },
                            child: Center(
                              child: Container(
                                width: 20.h,
                                  height: 20.h,
                                  child:Image.asset(round_button)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h,),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              border: Border.all(width: 1, color: Colors.black)
                          ),
                        ),
                        SizedBox(width: 6.h,),
                        Text("Liguistic Content",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 12.h,right:12.h),
                      child: CommonBusinessTextField(context: context, hintText: "Liguistic Content", maxLine: 2),
                    ),

                    SizedBox(height: 10.h,),
                    Center(child: CommonElevatedButton(context: context, lableText: txtSubmit,ButtonBackground: Colors.black,onTap:(){
                      Navigator.pop(context);
                    },))






                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }

  _pickImage() async {
   XFile? images= await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(images!.path);
    });

  }

  addDynamic(){
    final index = dynamicList.length;
    print("index::"+index.toString());
    dynamicList.add(new dynamicWidget(onPress: (){
      setState(() {
        dynamicList.removeAt(index);
      });

    },));
  }


}
class CategoryList {

  final String title;
  CategoryList(this.title );
}
