import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessTextField.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/ui/AddRestaurantMainDetail.dart';
import 'package:my_dasma/ui/SingerAudioSelection.dart';
import 'package:my_dasma/ui/SingerContentScreen.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class MediaSelection extends StatefulWidget {
  const MediaSelection({Key? key}) : super(key: key);

  @override
  _MediaSelectionState createState() => _MediaSelectionState();
}

class _MediaSelectionState extends State<MediaSelection> {

  List<XFile>? images = [];
  List<File>? imageFileArray = [];
  var _image;
  var imagePicker;


  var videoPicker;
  File? _video;
  Uint8List? video;
  List<Uint8List> videoList=<Uint8List>[];
  VideoPlayerController? _videoPlayerController;
  var videoLinkController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
    videoPicker = new ImagePicker();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        AppBarBackground: blackDark,
        isLeading: true,
        title: "Media Selection",
        textColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16.0.w, top: 8.0.h, right: 16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txtPhotosOfTheRest,
                style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 5.h,
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
              imageFileArray != null && imageFileArray!.length >0 ? SizedBox(
                height: 20.0.h,
              ):SizedBox(height: 5.h,),
           imageFileArray != null && imageFileArray!.length >0 ? GridView.builder(
                itemCount: imageFileArray!.length,
             physics: NeverScrollableScrollPhysics(),
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
                            padding:  EdgeInsets.all(5.0),
                            height: 250.h, width: 250.h,color: Colors.white,
                            child: Image.file(imageFileArray![index],fit: BoxFit.fill,)),
                      ),
                      Positioned(
                        top:-15.0,
                        right:-13.0,
                        child: new IconButton(
                            icon: Icon(Icons.cancel,color: Colors.black,size: 22,),
                            onPressed: () {

                              setState(() {

                                imageFileArray!.removeAt(index);
                                print("videolist length:"+imageFileArray!.length.toString());
                              });

                            }),
                      ),

                    ],
                  );
                },
              ):Container(),
              SizedBox(
                height: 20.0.h,
              ),
              Text(
                txtRestaurantVideos,
                style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 5.h,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: blackDark),
                  icon: Icon(
                    Icons.camera_alt,
                    size: 20.0.r,
                  ),
                  onPressed: () async {
                    _pickVideo();
                  },
                  label: Text(txtSelectVideos,
                      style: TextStyle(color: Colors.white, fontSize: 16.0))),
              videoList != null && videoList.length >0 ? SizedBox(
                height: 20.0.h,
              ):SizedBox(height: 5.h,),
              videoList!=null && videoList.length > 0 ?GridView.builder(
                itemCount: videoList.length,
                physics: NeverScrollableScrollPhysics(),
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
                            padding:  EdgeInsets.all(5.0),
                            height: 250.h, width: 250.h,color: Colors.white,
                            child: Image.memory(videoList[index],fit: BoxFit.fitHeight,)),
                      ),
                      Positioned(
                        top:-15.0,
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
              ):Container(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "On Youtube Video At Restaurants",
                style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 10.h,
              ),
              CommonBusinessTextField(context: context, hintText: "Video Link", maxLine: 2, controller: videoLinkController,),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment. topRight,
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  child: FittedBox(
                    child: FloatingActionButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          //builder: (context) => AddRestaurantMainScreen()));
                          builder: (context) => SingerAudioSelection()));
                    },
                      foregroundColor: Colors.white,
                         backgroundColor: Colors.black,
                      tooltip: 'Open New Page',
                           child: new Icon(Icons.navigate_next,size: 30,),),
                  ),
                ),
              ),

              // Align(
              //   alignment: Alignment. center,
              //   child: FloatingActionButton(
              //
              //     foregroundColor: Colors.white,
              //     backgroundColor: Colors.black,
              //     onPressed: (){
              //       // Navigator.of(context).push(MaterialPageRoute(
              //       //     builder: (context) => MediaSelection()));
              //     },
              //     tooltip: 'Open New Page',
              //     child: new Icon(Icons.navigate_next),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }

  _pickVideo() async {
    PickedFile? pickedFile = await videoPicker.getVideo(source: ImageSource.gallery);

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

      });


  }
}
