import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(),

        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.only(left: 16.0.w, top: 16.0.h, right: 8.0.w, bottom: 8.0.h),
              margin: EdgeInsets.only(left: 8.0.w, top: 8.0.h, right: 8.0.w, bottom: 8.0.h),
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/item_image.png"),
                  fit: BoxFit.cover
                ),
                  borderRadius: BorderRadius.circular(15.0.r),
                  color: Colors.black.withOpacity(0.7),
                  backgroundBlendMode: BlendMode.darken
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(height: 8.0.h,),
                  Text("Description")
                ],
              ),
            );
          },
      ),
    ));
  }
}
