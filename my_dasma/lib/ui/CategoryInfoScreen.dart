import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/providers/CategoryDetailProvider.dart';
import 'package:my_dasma/ui/ImagePreviewScreen.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;


class CategoryInfoScreen extends StatefulWidget {

   String isFrom="";
  // CategoryDetailListDetailPage(this.restName);

   CategoryInfoScreen({Key? key,required this.isFrom}) : super(key: key);

  @override
  _CategoryInfoScreenState createState() => _CategoryInfoScreenState();
}

class _CategoryInfoScreenState extends State<CategoryInfoScreen>  with SingleTickerProviderStateMixin {


  late CategoryDetailProvider categoryDetailProviderRead;
  late CategoryDetailProvider categoryDetailProviderWatch;

  final List<DataList> data = <DataList>[
    DataList(
      'Menu 3700 LEK  € 30.00 Per person',
      <DataList>[
        DataList(
          'WELCOME COCKTAIL',),
        DataList('Spumante, fruit juice, fireworks'),
        DataList('appetizer'),
      ],
    ),
    DataList(
      'Menu 4700 LEK  € 38.00 Per person',
      <DataList>[
        DataList('WELCOME COCKTAIL'),
        DataList('appetizer'),
      ],
    ),
    DataList(
      'Menu 5900 LEK  € 48.00 Per person',
      <DataList>[
        DataList('appetizer'),
        DataList('WELCOME COCKTAIL'),
        DataList(
          'fruit juice, fireworks',

        ),
      ],
    ),
  ];

  final List<EquipmentList> equipmentList = <EquipmentList>[
    EquipmentList(parkingIcon,"Car parking"),
    EquipmentList(playgroundIcon,"Children's playground"),
    EquipmentList(swimmingpoolIcon,"swimming pool"),
  ];

  List<String> images = [
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/400",
    "https://picsum.photos/200/100",
    "https://picsum.photos/200/500"
  ];

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
     appBar:CommonAppBar(appBar: AppBar(),isLeading: true,textColor: Colors.white,title:widget.isFrom ,AppBarBackground: colorPurple,),
      body:Padding(
        padding: EdgeInsets.all(10.h),
        child:widget.isFrom==txtDescription?descriptionWidget():widget.isFrom==txtMenu?menuWidget():widget.isFrom==txtEquipment?EquipmentWidget():widget.isFrom==txtPhotos?
        photoGallery():Container()
      ),
    );
  }

  Widget descriptionWidget()
  {
    return Container(
      child: Text(resDescription,style: TextStyle(fontSize: 14.sp,color:Colors.black),),
    );
  }
  Widget EquipmentWidget()
  {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          equipmentListdata(equipmentList[index]),
      itemCount: equipmentList.length,

    );
  }

  Widget photoGallery()
  {
    return Container(
        // padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //  crossAxisCount: 3,
              crossAxisCount:  3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,

          ),
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
                onTap: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ImagePreviewScreen(galleryItems: images,currentIndex: index,)));
                },
                child: Image.network(images[index],fit: BoxFit.fill,));
          },
        ));


  }
  Widget equipmentListdata(EquipmentList eqipmentlist)
  {
    return Card(
      elevation: 20,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),

      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Row(
          children: [
            Image.asset(eqipmentlist.image),
            SizedBox(width: 10.w,),
            Text(eqipmentlist.title)
          ],
        ),
      ),
    );

  }
  Widget menuWidget()
  {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          DataPopUp(data[index]),
      itemCount: data.length,
    );
  }
}

class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);

  final DataList popup;

  Widget _buildTiles(DataList root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return Column(
      children: [
        Container(
          color: Color(0xffDCBDFC),
          child: ExpansionTile(
            key: PageStorageKey<DataList>(root),
            backgroundColor:Colors.white ,

            title: Text(
              root.title,
            ),

            children: root.children.map(_buildTiles).toList(),
          ),
        ),

        SizedBox(height: 10.h,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(popup);
  }
}

class DataList {
  DataList(this.title, [this.children = const <DataList>[]]);

  final String title;
  final List<DataList> children;
}

class EquipmentList{

  String image,title;
  EquipmentList(this.image,this.title);
}


