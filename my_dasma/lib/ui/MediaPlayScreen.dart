import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:video_viewer/domain/entities/video_source.dart';
import 'package:video_viewer/video_viewer.dart';
import 'package:flutter/services.dart';


class MediaPlayScreen extends StatefulWidget {
  const MediaPlayScreen({Key? key}) : super(key: key);

  @override
  _MediaPlayScreenState createState() => _MediaPlayScreenState();
}

class _MediaPlayScreenState extends State<MediaPlayScreen> {
  var videoUrl =
      "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4";

  Map<String, VideoSource> source = {
    '720p': VideoSource(
          video: VideoPlayerController.network(
            "https://github.com/intel-iot-devkit/sample-videos/blob/master/classroom.mp4"))

   // "https://github.com/intel-iot-devkit/sample-videos/blob/master/classroom.mp4"
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CommonAppBar(
        appBar: AppBar(),
        title: txtMedia,
        AppBarBackground: colorPurple,
        isLeading: false,
        // isDrawer: true,
        textColor: Colors.white,
      ),

      /*body:SafeArea(
        child:  Container(
            alignment: Alignment.center,
            color: Colors.white,
            child:
            Image.asset(coming soon,height: 120.h,width: 300.h,)
          // Text("${tr("current")}: ${HomeScreen.mainMenu[_currentPage].title}"),
        ),

      ),*/

      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade100,
        /*child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0.h,
                      ),

                      *//* FlickVideoPlayer(
                          flickManager: flickManager,
                      ),*//*

                      *//* VlcPlayer(
                        controller: _videoPlayerController,
                        aspectRatio: 16 / 9,
                        placeholder: Center(child: CircularProgressIndicator()),
                      ),*//*

                      *//*FutureBuilder<Map<String, VideoSource>>(
                        future: VideoSource.fromM3u8PlaylistUrl(
                          "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
                          //"https://www.mydasma.com/webroot/img/uploads/medias/1579772783_Video_2_-_Singer's_marketing_2019_-_final_one.mp4",
                          formatter: (quality) => quality == "Auto"
                              ? "Automatic"
                              : "${quality.split("x").last}p",
                        ),

                      //  future: VideoSource.fromNetworkVideoSources(source as Future<Map<String, VideoSource>>),

                       // future: VideoSource.fromNetworkVideoSources({}),

                        builder: (_, data) {
                          return data.hasData
                              ? VideoViewer(
                                  //source: data.data
                                  //source: source,
                                  source: data.requireData,

                                  onFullscreenFixLandscape: true,
                                  style: VideoViewerStyle(
                                    thumbnail: Image.network(
                                      "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
                                    ),

                                   // thumbnail: Image.network("https://www.mydasma.com/media#"),
                                  ),
                                )
                              : CircularProgressIndicator();
                        },
                      ),*//*

                      VideoViewer(source: {'720': VideoSource(
                          video: VideoPlayerController.network(
                              "https://www.mydasma.com/webroot/img/uploads/medias/1579772783_Video_2_-_Singer's_marketing_2019_-_final_one.mp4"))},
                        onFullscreenFixLandscape: true,
                        style: VideoViewerStyle(
                          thumbnail: Image.network(
                            "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
                          ),

                        ),),

                      SizedBox(height: 16.0.h,),

                      Padding(
                        padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
                        child: Text(
                          "Special invitation to all Albanian singers (Part Two)",
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                    ],
                  )),
            );
          },
        ),*/


        child:  Container(
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: VideoViewer(source: {'720': VideoSource(
              video: VideoPlayerController.network(
                  "https://www.mydasma.com/webroot/img/uploads/medias/1579772783_Video_2_-_Singer's_marketing_2019_-_final_one.mp4"))},
            onFullscreenFixLandscape: true,
            enableShowReplayIconAtVideoEnd: true,
            enableFullscreenScale: true,
            autoPlay: true,
            style: VideoViewerStyle(
              thumbnail: Image.network(
                "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
              ),
              settingsStyle: SettingsMenuStyle(
                settings: Container(),

              ),
            ),),
        ),
      ),
    );
  }
}
