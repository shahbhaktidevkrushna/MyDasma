import 'dart:io';
import 'dart:math' show pi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

import 'MediaPlayScreen.dart';


class MediaScreen extends StatefulWidget {

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {

  late final fileName;

  //late String _tempDir;
  String? _tempDir = "";
  late String filePath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //getTemporaryDirectory().then((d) => _tempDir = d.path);
   // _tempDir = getTempDir as String?;


   // getThumbnail();

    /*setState(() {
      final file = File(fileName);
      filePath = file.path;
    });

    final file = File(fileName);
    filePath = file.path;*/
  }


 /* @override
  void initState() {
    super.initState();

    VideoPlayerOptions videoPlayerOptions;

    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(videoUrl),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }*/

  /*late VlcPlayerController _videoPlayerController;

  Future<void> initializePlayer() async {}

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
     // 'https://media.w3.org/2010/05/sintel/trailer.mp4',
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      hwAcc: HwAcc.FULL,
      autoPlay: false,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    //await _videoViewController.dispose();
    await _videoPlayerController.dispose();
  }*/

  @override
  Widget build(BuildContext context) {

    /*  final file = File(fileName);
      filePath = file.path;*/

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CommonAppBar(
        appBar: AppBar(),
        title: txtMedia,
        AppBarBackground:colorPurple,
        isLeading: false,
        // isDrawer: true,
        textColor: Colors.white,

      ),

      /*body:SafeArea(
        child:  Container(
            alignment: Alignment.center,
            color: Colors.white,
            child:
            Image.asset(comingsoon,height: 120.h,width: 300.h,)
          // Text("${tr("current")}: ${HomeScreen.mainMenu[_currentPage].title}"),
        ),

      ),*/

      body:Container(
        alignment: Alignment.center,
        color: Colors.grey.shade100,
        child:
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){

            return Container(
              margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0.h,),

                     /* FlickVideoPlayer(
                          flickManager: flickManager,
                      ),*/

                     /* VlcPlayer(
                        controller: _videoPlayerController,
                        aspectRatio: 16 / 9,
                        placeholder: Center(child: CircularProgressIndicator()),
                      ),*/

                /*FutureBuilder<Map<String, VideoSource>>(
                  future: VideoSource.fromM3u8PlaylistUrl(
                    "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
                    formatter: (quality) => quality == "Auto" ? "Automatic" : "${quality.split("x").last}p",
                  ),
                  builder: (_, data) {
                    return data.hasData
                        ? VideoViewer(
                      //source: data.data
                      source: data.requireData,

                      onFullscreenFixLandscape: true,
                      style: VideoViewerStyle(
                        thumbnail: Image.network(
                          "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
                        ),
                      ),
                    )
                        : CircularProgressIndicator();
                  },
                ),*/
                     /* Image.network(
                        "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
                      ),*/

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MediaPlayScreen()));
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              backgroundBlendMode: BlendMode.darken),
                          //height: 240,
                          child: Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => MediaPlayScreen()));
                                },
                                child: Image.network(
                                  "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
                                fit: BoxFit.fill,),

                              //  child: Text(getThumbnail().toString())

                               //   child: Image(image: AssetImage(filePath)),

                              ),
                              Positioned(
                                bottom: 0, right: 0,
                                top: 0, left: 0,
                                //give the values according to your requirement
                                child: Icon(Icons.play_arrow_rounded, size: 60.r, color: Colors.deepPurple,),
                               /* child: Image.asset('assets/play_circle_img2.png',
                                width: 60.w, height: 60.h),*/
                              ),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: 16.0.h,),

                      Padding(
                        padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
                        child: Text("Special invitation to all Albanian singers (Part Two)",
                          style: TextStyle(fontSize: 18.sp,), textAlign: TextAlign.center,),
                      ),

                      SizedBox(height: 16.0.h,),
                    ],
                  )
              ),
            );
          },
        ),
      ),

    );
  }

  Future<String?> getThumbnail() async {

    /*setState(() {
      final file = File(fileName);
      filePath = file.path;
    });*/

    return fileName = await VideoThumbnail.thumbnailFile(
        //video: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        video: "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
       //thumbnailPath: (await getTemporaryDirectory()).path,
       thumbnailPath: _tempDir,

    imageFormat: ImageFormat.WEBP,
    maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    quality: 75);

    setState(() {
      final file = File(fileName);
      filePath = file.path;
    });

  }

  /*static Future<Directory> getApplicationDocumentsDirectory() async {
    return new Directory((await _pathProviderProxy.ptr.applicationDocumentsDirectory()).path);*/

    Future<String> get getTempDir async {
      /*Directory tempDir = await getTemporaryDirectory();
      return tempDir.path;*/

      Directory tempDir = await getTemporaryDirectory();
      return tempDir.path;
    }
}
