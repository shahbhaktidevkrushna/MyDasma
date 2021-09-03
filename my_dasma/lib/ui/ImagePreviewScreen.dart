import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/providers/CategoryDetailProvider.dart';
import 'package:my_dasma/ui/MediaScreen.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;


class ImagePreviewScreen extends StatefulWidget {

  List<String> galleryItems;
  final int currentIndex;

   ImagePreviewScreen({Key? key,required this.galleryItems,this.currentIndex=0}) : super(key: key);

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState(this.currentIndex);
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen>  with SingleTickerProviderStateMixin {
  int currentIndex;
  _ImagePreviewScreenState(this.currentIndex);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {


    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar:CommonAppBar(appBar: AppBar(),isLeading: true,textColor: Colors.white,title:"Image Preview" ,AppBarBackground: colorPurple,),
      body:Padding(
        padding: EdgeInsets.all(10.h),
        child:Container(
          // height: MediaQuery.of(context).size.height,
          //   color: Colors.red,
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(

                  imageProvider: NetworkImage(widget.galleryItems[index],),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.currentIndex),
                  // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
                );
              },
              itemCount: widget.galleryItems.length,
              // loadingBuilder: (context, event) => Center(
              //   child: Container(
              //     width: 20.0,
              //     height: 20.0,
              //     child: CircularProgressIndicator(
              //       value: event == null
              //           ? 0
              //           : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              //     ),
              //   ),
              // ),
              backgroundDecoration: BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).canvasColor,
              ),
              onPageChanged: (index) {
                currentIndex = index;
                print("Current Index is - $currentIndex");
              },
              // backgroundDecoration: widget.backgroundDecoration,
              pageController: PageController(initialPage: currentIndex),
              enableRotation:true,
              // customSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(
                    backgroundColor:colorPurple,
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded / event.expectedTotalBytes!
                  ),
                ),
              ),
            )
        )
      ),
    );
  }




}



