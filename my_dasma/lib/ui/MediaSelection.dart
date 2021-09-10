import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';


class MediaSelection extends StatefulWidget {
  const MediaSelection({Key? key}) : super(key: key);

  @override
  _MediaSelectionState createState() => _MediaSelectionState();
}

class _MediaSelectionState extends State<MediaSelection> {
  // for pick images
  List<XFile>? images = [];
  List<File>? imageFileArray = [];
  var _image;
  var imagePicker;

  // for pick videos
  List<XFile>? videos = [];
  List<File>? videoFileArray = [];
  var _video;
  var videoPicker;

  late List uint8listImage = [];

  //String? filePath;
  late File file2;

  late VideoPlayerController _videoPlayerController;

  int _counter = 0;
  String? thumbNailImage;
  late VideoPlayerController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
    videoPicker = new ImagePicker();
  }

  /*Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
        await Permission.storage.request().isGranted &&
        await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        AppBarBackground: blackDark,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16.0.w, top: 8.0.h, right: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txtPhotosOfTheRest,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: blackDark),
                icon: Icon(
                  Icons.camera_alt,
                  size: 20.0.r,
                ),
                onPressed: () async {
                  var source = ImageSource.gallery;
                  images = await imagePicker.pickMultiImage();

                  setState(() {
                    //_image = File(images!.path);
                    // fileArray!.clear();
                    for (int i = 0; i < images!.length; i++) {
                      _image = File(images![i].path);
                      imageFileArray!.add(_image);
                    }
                  });
                },
                label: Text(txtSelectPhotos,
                    style: TextStyle(color: Colors.white, fontSize: 16.0))),
            Expanded(
              child: new GridView.count(
                crossAxisCount: 3,
                children: imageFileArray != null
                    ? new List<Widget>.generate(imageFileArray!.length,
                        (index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                           // padding: EdgeInsets.only(top: 12, right: 12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  child: new GridTile(
                                    child: new Card(
                                        color: Colors.grey.shade200,
                                        child: Image.file(
                                          imageFileArray![index],
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),

                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      /*border: Border(
                                      top: BorderSide(width: 1,  color: Colors.black.withOpacity(0.7)),
                                      left: BorderSide(width: 1, color: Colors.black.withOpacity(0.7)),
                                      right: BorderSide(width: 1, color: Colors.black.withOpacity(0.7)),
                                      bottom: BorderSide(width: 1, color: Colors.black.withOpacity(0.7)),
                                    ),*/
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black.withOpacity(0.6),

                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                    : new List<Widget>.generate(1, (index) {
                        return new GridTile(
                          child: new Card(
                              color: Colors.grey.shade200,
                              child: new Center(
                                //child: new Text('tile $index'),
                                child: Container(
                                  child: Text("No image selected"),
                                ),
                              )),
                        );
                      }),
              ),
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Text(
              txtRestaurantVideos,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: blackDark),
                icon: Icon(
                  Icons.camera_alt,
                  size: 20.0.r,
                ),
                onPressed: () async {
                  var source = ImageSource.gallery;
                  //_pickVideo();
                  XFile? videos =
                      await videoPicker.pickVideo(source: ImageSource.gallery);

                  setState(() async {
                    _video = File(videos!.path);
                    print("video path:" + _video.toString());
                  });
                },
                label: Text(txtSelectVideos,
                    style: TextStyle(color: Colors.white, fontSize: 16.0))),
            Expanded(
              child: new GridView.count(
                crossAxisCount: 3,
                children: uint8listImage != null
                    ? new List<Widget>.generate(uint8listImage.length, (index) {
                        return InkWell(
                          onTap: () {},
                          child: new GridTile(
                            child: new Card(
                                color: Colors.grey.shade200,
                                //child: Image.file(videoFileArray![index], fit: BoxFit.fill,)
                                child: Image.memory(
                                  uint8listImage[index],
                                  fit: BoxFit.fill,
                                )),
                          ),
                        );
                      })
                    : new List<Widget>.generate(1, (index) {
                        return new GridTile(
                          child: new Card(
                              color: Colors.grey.shade200,
                              child: new Center(
                                //child: new Text('tile $index'),
                                child: Container(
                                  child: Text("No video selected"),
                                ),
                              )),
                        );
                      }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
