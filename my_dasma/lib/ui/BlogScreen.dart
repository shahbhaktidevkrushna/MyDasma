import 'dart:io';
import 'dart:math' show pi;
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'UserDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BlogScreen extends StatefulWidget {

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {


   File? _video;
   Uint8List? video;
   List<Uint8List> videoList=<Uint8List>[];
   VideoPlayerController? _videoPlayerController;
   VideoPlayerController? _cameraVideoPlayerController;

  ImagePicker picker = ImagePicker();




  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
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

                    if (videoList != null && videoList.length > 0)
                      // _videoPlayerController!.value.isInitialized
                      //     ?

                      // Container(
                      //       height: 100.h,
                      //       width: 100.h,
                      //       color: Colors.red,
                      //       child: Image.memory(video!),
                      //       //VideoPlayer(_videoPlayerController!),)
                      GridView.builder(
                        itemCount: videoList.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //  crossAxisCount: 3,
                          crossAxisCount:  3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,

                        ),
                        itemBuilder: (BuildContext context, int index){
                          return Stack(
                            clipBehavior: Clip.none,
                            children: [

                              Container(
                                child: Container(
                                    padding:  EdgeInsets.all(10.0),
                                    height: 250.h, width: 250.h,color: Colors.white,
                                    child: Image.memory(videoList[index],fit: BoxFit.fitHeight,)),
                              ),
                              Positioned(
                                top:-10.0,
                                right:-13.0,
                                child: new IconButton(
                                    icon: Icon(Icons.cancel,color: Colors.black,size: 22,),
                                    onPressed: () {

                                    setState(() {

                                      videoList.removeAt(index);
                                      print("videolist length:"+videoList.length.toString());
                                    });

                                    }),
                              ),
                              Positioned(
                                bottom: 0, right: 0,
                                top: 0, left: 0,
                                //give the values according to your requirement
                                child: Icon(Icons.play_arrow_rounded, size: 40.r, color: Colors.black,),
                                /* child: Image.asset('assets/play_circle_img2.png',
                                width: 60.w, height: 60.h),*/
                              ),
                            ],
                          );
                        },
                      )
                      // ListView.builder(
                      //         shrinkWrap: true,
                      //         itemCount: videoList.length,
                      //         itemBuilder: (context, index){
                      //          return Container(
                      //             height: 100.h,
                      //             width: 100.h,
                      //             color: Colors.red,
                      //             child:
                      //             Image.memory(videoList![index]),
                      //
                      //             );
                      //         }
                      //
                      //     )
                      //     : Container()
                    else
                      Text(
                        "Click on Pick Video to select video",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    RaisedButton(
                      onPressed: () {
                        _pickVideo();
                      },
                      child: Text("Pick Video From Gallery"),
                    ),
                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }




  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile? pickedFile = await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile!.path);
    video = await VideoThumbnail.thumbnailData(
      video: pickedFile.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 200,
      maxHeight: 200,// specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 40,
    );

    videoList.add(video!);
    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        // _videoPlayerController!.play();
      });
    // print("videolist length::"+videoList.length.toString());
    // for(int i=0;i<videoList.length;i++)
    //   {
    //     _videoPlayerController = VideoPlayerController.file(videoList[i])
    //       ..initialize().then((_) {
    //         setState(() {});
    //         // _videoPlayerController!.play();
    //       });
    //   }

  }



}
