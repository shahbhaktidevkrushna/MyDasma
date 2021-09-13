import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/providers/CategoryDetailProvider.dart';
import 'package:my_dasma/ui/CategoryInfoScreen.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;


class CategoryDetailListDetailScreen extends StatefulWidget {

   String restName="",isFrom;
  // CategoryDetailListDetailPage(this.restName);

   CategoryDetailListDetailScreen({Key? key,required this.restName,required this.isFrom}) : super(key: key);

  @override
  _CategoryDetailListDetailScreenState createState() => _CategoryDetailListDetailScreenState();
}

class _CategoryDetailListDetailScreenState extends State<CategoryDetailListDetailScreen>  with SingleTickerProviderStateMixin {

  List<String> partyList=['wedding',
                'Konagjeqi',
                'engagement',
                'Continuity',
                'birthday',
                'Semi-mature',
                'Matura exam',
                'Concerts',];
  List<String> priceList=['120Rs.',
    '140Rs.',
    '160Rs.',
    '180Rs.',
   ];
  late CategoryDetailProvider categoryDetailProviderRead;
  late CategoryDetailProvider categoryDetailProviderWatch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      categoryDetailProviderRead=context.read<CategoryDetailProvider>();

    });
  }
  @override
  Widget build(BuildContext context) {
    categoryDetailProviderWatch=context.watch<CategoryDetailProvider>();
    return Scaffold(
     appBar:CommonAppBar(appBar: AppBar(),isLeading: true,textColor: Colors.white,title:widget.restName ,AppBarBackground: colorPurple,),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(catDetailImage2, height: 150.h,width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,),
              ),
              SizedBox(height: 10.h,),
              Text(widget.restName,style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),),

              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.w),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: colorPurple,

                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 5.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      //color: secondary,
                      size: 12,
                    ),
                    SizedBox(
                      width: 2,
                    ),

                    Expanded(
                      child: Container(
                        child: Text(txtCatListSubTitle4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              //color: primary,
                                fontSize: 14.sp, letterSpacing: .3)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              widget.isFrom==catRest?catRestaurant():Container(),
              widget.isFrom==catSinger?catSinge():Container(),
              widget.isFrom==catCameraman?catCamera():Container(),
              widget.isFrom==catPhotographer?catPhotograph():Container(),
              widget.isFrom==catCameraPhotographer?catCameraPhotograph():Container(),
              widget.isFrom==catDecoration?catDecorate():Container(),
              widget.isFrom==catMakeup?catHairDressMakeup():Container(),
              widget.isFrom==catDJ?catDjs():Container(),
              widget.isFrom==catDancer?catDancers():Container(),



            ],
          ),
        )
      ),
    );
  }

  Widget catRestaurant()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtResBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
    Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
              SizedBox(
                height: 5.h,
              ),
              Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
            ],
          ),

        ],
      ),
    ),
        SizedBox(height: 5.h,),
        Row(
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorPurple,
                  border: Border.all(width: 1, color: colorPurple)
              ),
            ),
            SizedBox(width: 6.h,),
            Text(txtPartyName,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(height: 10.h,),
        dropDownButton(partyList,"select party name",true),
        SizedBox(height: 10.h,),
        Row(
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorPurple,
                  border: Border.all(width: 1, color: colorPurple)
              ),
            ),
            SizedBox(width: 6.h,),
            Text(txtPricePerPerson,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(height: 10.h,),
        dropDownButton(priceList,"select Price",false),
        SizedBox(height: 10.h,),
        Text(txtResOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDescription,txtDescription),
        textWithIcon(packagesIcon,txtMenu,txtMenu),
        textWithIcon(equipmentIcon,txtEquipment,txtEquipment),
        textWithIcon(freeServiceIcon,txtFreeServices,txtFreeServices),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),



      ],
    );
  }

  Widget catSinge()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtSingerBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
    Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
              SizedBox(
                height: 5.h,
              ),
              Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
            ],
          ),

        ],
      ),
    ),
        SizedBox(height: 5.h,),
       
        Text(txtSingerOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(freeServiceIcon,txtSkills,txtSkills),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),



      ],
    );
  }

  Widget catCamera()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtCameraBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
    Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
              SizedBox(
                height: 5.h,
              ),
              Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
            ],
          ),
          Container(height: 40.h, child: VerticalDivider(color: Colors.grey)),
          Column(
            children: [
              Text(txtPartyName,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
              SizedBox(
                height: 5.h,
              ),
              dropDownButton(partyList,"select party name",true),
            ],
          ),
        ],
      ),
    ),
        SizedBox(height: 5.h,),

        Row(
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorPurple,
                  border: Border.all(width: 1, color: colorPurple)
              ),
            ),
            SizedBox(width: 6.h,),
            Text("The package you want",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(height: 10.h,),
        dropDownButton(priceList,"select Package",false),
        SizedBox(height: 10.h,),
        Text(txtCameraOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,"Offer Packages","Offer packages"),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),



      ],
    );
  }

  Widget catPhotograph()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtPhotographerBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),
              Container(height: 40.h, child: VerticalDivider(color: Colors.grey)),
              Column(
                children: [
                  Text(txtPartyName,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  dropDownButton(partyList,"select party name",true),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h,),

        Row(
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorPurple,
                  border: Border.all(width: 1, color: colorPurple)
              ),
            ),
            SizedBox(width: 6.h,),
            Text("The package you want",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(height: 10.h,),
        dropDownButton(priceList,"select Package",false),
        SizedBox(height: 10.h,),
        Text(txtPhotographerOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,"Offer Packages","Offer packages"),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),



      ],
    );
  }

  Widget catCameraPhotograph()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtPhotographerBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),
              Container(height: 40.h, child: VerticalDivider(color: Colors.grey)),
              Column(
                children: [
                  Text(txtPartyName,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  dropDownButton(partyList,"select party name",true),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h,),

        Row(
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorPurple,
                  border: Border.all(width: 1, color: colorPurple)
              ),
            ),
            SizedBox(width: 6.h,),
            Text("The package you want",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(height: 10.h,),
        dropDownButton(priceList,"select Package",false),
        SizedBox(height: 10.h,),
        Text(txtPhotographerOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,"Offer Packages","Offer packages"),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),



      ],
    );
  }

  Widget catDecorate()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtDecorationBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),
              Container(height: 40.h, child: VerticalDivider(color: Colors.grey)),
              Column(
                children: [
                  Text(txtPartyName,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  dropDownButton(partyList,"select party name",true),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h,),

        Row(
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorPurple,
                  border: Border.all(width: 1, color: colorPurple)
              ),
            ),
            SizedBox(width: 6.h,),
            Text("The package you want",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(height: 10.h,),
        dropDownButton(priceList,"select Package",false),
        SizedBox(height: 10.h,),
        Text(txtDecorationOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,"Offer Packages","Offer packages"),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(freeServiceIcon,txtSkills,txtSkills),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),



      ],
    );
  }

  Widget catHairDressMakeup()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtHairdressersMakeupBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),
              Container(height: 40.h, child: VerticalDivider(color: Colors.grey)),
              Column(
                children: [
                  Text(txtService,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Makeup",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 10.h,),
        Text(txtHairdressersMakeupOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(freeServiceIcon,txtSkills,txtSkills),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),

      ],
    );
  }

  Widget catDjs()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtDjBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),

            ],
          ),
        ),

        SizedBox(height: 10.h,),
        Text(txtDjOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(freeServiceIcon,txtSkills,txtSkills),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),

      ],
    );
  }

  Widget catDancers()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txtDancersBasicInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Shkurte Fejza",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.normal),),
                ],
              ),

            ],
          ),
        ),

        SizedBox(height: 10.h,),
        Text(txtDancersOtherInfo,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        textWithIcon(descriptionIcon,txtDetail,txtDetail),
        textWithIcon(freeServiceIcon,txtCalendar,txtCalendar),
        textWithIcon(freeServiceIcon,txtSkills,txtSkills),
        textWithIcon(locationIcon,txtLocation,txtLocation),
        textWithIcon(photoIcon,txtPhotos,txtPhotos),
        textWithIcon(reviewIcon,txtComment,txtComment),

      ],
    );
  }

  Widget dropDownButton(List<String> list, String hint,bool isForPartName){
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 0 , bottom: 0,top:0),
      child: Container(
        height: 45,  //gives the height of the dropdown button
        width: MediaQuery.of(context).size.width/2, //gives the width of the dropdown button
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color(0xFFF2F2F2)
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 13), //you can include padding to control the menu items
        child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white, // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true,  //If false (the default), then the dropdown's menu will be wider than its button.
                )
            ),
            child: DropdownButtonHideUnderline(  // to hide the default underline of the dropdown button
              child: DropdownButton<String>(
                iconEnabledColor: Color(0xFF595959),  // icon color of the dropdown button
                items: list.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(hint,style: TextStyle(color: Color(0xFF8B8B8B),fontSize: 15),),  // setting hint
                onChanged: (value){
                  if(isForPartName)
                    {
                      categoryDetailProviderWatch.setPartName(value.toString());
                    }
                  else
                    {
                      categoryDetailProviderWatch.setPrice(value.toString());
                    }

                },
                value: isForPartName?categoryDetailProviderWatch.partyName:categoryDetailProviderWatch.pricePerPerson,  // displaying the selected value
              ),
            )
        ),
      ),
    );
  }

  Widget textWithIcon(String icon,String text,String isFrom)
  {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryInfoScreen(isFrom: isFrom)));
          },
          child: Row(
            children: [
              Image.asset(icon,height: 15.h,width: 15.h,color:colorPurple,),
              SizedBox(width: 10.h,),
              Text(text,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w400),),
              Spacer(),
              Center(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child:  Icon(Icons.arrow_back_ios_sharp,size: 20,),
                ),
              )


            ],
          ),
        ),
        SizedBox(height: 5.h,),
        Divider(height: 2.h,color: Colors.black,),
        SizedBox(height: 5.h,)
      ],
    );
  }
}
