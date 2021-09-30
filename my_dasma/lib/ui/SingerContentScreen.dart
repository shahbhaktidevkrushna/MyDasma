import 'package:flutter/cupertino.dart';

import 'dart:io';
import 'dart:typed_data';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessTextField.dart';
import 'package:my_dasma/extras/commonWidgets/CommonEditText.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:my_dasma/extras/constants/Constant.dart';

import 'package:my_dasma/extras/constants/Constant.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:my_dasma/extras/utils/AudioManager.dart';
import 'package:provider/provider.dart';

late _SingerContentScreenState pageState;

class SingerContentScreen extends StatefulWidget {
  SingerContentScreen({Key? key}) : super(key: key);

  @override
  _SingerContentScreenState createState() => _SingerContentScreenState();
}

class _SingerContentScreenState extends State<SingerContentScreen> {
  var biographySController = TextEditingController();
  var addressController = TextEditingController();
  AudioManager? audioManager=null;
  List<videoData> videoList=<videoData>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        AppBarBackground: Colors.black,
        title: "Content",
        isLeading: true,
        // isDrawer: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                txtBiographyOfSinger,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              CommonBusinessTextField(
                  context: context,
                  hintText: txtBiographyOfSinger,
                  controller: biographySController,
                  maxLine: 4),
              SizedBox(
                height: 8.h,
              ),
              Text(
                txtPrice,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              CommonBusinessTextField(
                  context: context,
                  hintText: txtPrice,
                  controller: biographySController,
                  maxLine: 1),
              SizedBox(
                height: 8.h,
              ),
              Text(
                txtWidth,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              CommonBusinessTextField(
                  context: context,
                  hintText: txtWidth,
                  controller: biographySController,
                  maxLine: 1),
              SizedBox(
                height: 8.h,
              ),
              Text(
                txtLength,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              CommonBusinessTextField(
                  context: context,
                  hintText: txtLength,
                  controller: biographySController,
                  maxLine: 1),
              SizedBox(
                height: 8.h,
              ),
              Text(
                txtAddress,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              CommonBusinessTextField(
                  context: context,
                  hintText: txtAddress,
                  controller: addressController,
                  maxLine: 1),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Select Audio",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(primary: blackDark),
                      icon: Icon(
                        Icons.camera_alt,
                        size: 20.0.r,
                      ),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(type: FileType.audio,allowMultiple: true);
                        List<File> files = result!.paths.map((path) => File(path!)).toList();

                        setState(() {
                          for(int i=0;i<files.length;i++){

                            videoList.add(videoData(videourl: files[i],isPlaying: false));
                          }
                          print("file name:"+files[0].path.split('/').last);

                       });
                      },
                      label: Text("Select Audios",
                          style: TextStyle(color: Colors.white, fontSize: 16.0))),
                  // RaisedButton(
                  //   onPressed: () async {
                  //     FilePickerResult? result = await FilePicker.platform
                  //         .pickFiles(type: FileType.audio);
                  //     PlatformFile? file;
                  //     if (result != null) {
                  //       file = result.files.first;
                  //     }
                  //
                  //     setState(() {
                  //       _isPlaying = true;
                  //     });
                  //     playAudioFromLocalStorage(file!.path);
                  //   },
                  //   child: Text(
                  //     'Load Audio File',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   color: Colors.blueAccent,
                  // ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              videoList.length>0?Center(child: Text("Tap to play",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.bold),)):SizedBox(),
              videoList.length>0? SizedBox(
                height: 5.h,
              ):SizedBox(),
             videoList.length>0?ListView.builder(
                  itemCount: videoList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){

                    return Stack(
                      children: [
                        Container(

                          child: Padding(
                            padding: EdgeInsets.only(top:10.h,right:5.h),
                            child: Column(
                              children: [

                                Container(
                                  decoration: BoxDecoration(color:Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10), ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(10.h),
                                    child: Column(
                                      children: [

                                        GestureDetector(
                                          onTap: ()
                                          {
                                            setState(() {
                                              //videoList[index].isPlaying=true;
                                              audioManager=AudioManager(videoList[index].videourl!.path);
                                              print("index value::"+index.toString());
                                              for(int i=0;i<videoList.length;i++){
                                                print("i value::"+i.toString());
                                                if(i == index)
                                                {
                                                  print("match");
                                                  videoList[i].isPlaying=true;
                                                }
                                                else
                                                {
                                                  print("not match");
                                                  videoList[i].isPlaying=false;
                                                }
                                              }
                                            });

                                          },
                                          child: Container(

                                              width: MediaQuery.of(context).size.width,
                                              child: Center(child: Text(videoList[index].videourl!.path.split('/').last,style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.bold)))),
                                        ),

                                        audioManager!= null && videoList[index].isPlaying ?  Padding(
                                          padding:  EdgeInsets.only(left: 0,right: 0,top:0),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: ValueListenableBuilder<ProgressBarState>(
                                              valueListenable: audioManager!.progressNotifier,
                                              builder: (_, value, __) {
                                                return ProgressBar(
                                                  progressBarColor: Colors.black,
                                                  thumbColor: Colors.black,
                                                  baseBarColor: Colors.black.withOpacity(0.24),
                                                  bufferedBarColor:Colors.black.withOpacity(0.24) ,
                                                  progress: value.current,
                                                  buffered: value.buffered,
                                                  total: value.total,
                                                  timeLabelLocation: TimeLabelLocation.below,
                                                  onSeek: audioManager!.seek,
                                                );
                                              },
                                            ),
                                          ),
                                        ):Container(),
                                        audioManager!= null && videoList[index].isPlaying ?  ValueListenableBuilder<ButtonState>(
                                          valueListenable: audioManager!.buttonNotifier,

                                          builder: (_, value, __) {
                                            print("value:"+value.toString());
                                            switch (value) {
                                              case ButtonState.loading:
                                                return Container(
                                                  margin: EdgeInsets.all(8.0),
                                                  width: 32.0,
                                                  height: 32.0,
                                                  child: CircularProgressIndicator(),
                                                );
                                              case ButtonState.paused:
                                                return IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  icon: Icon(Icons.play_circle_filled),
                                                  color: Colors.black,
                                                  iconSize: 25.0,

                                                  onPressed: audioManager!.play,

                                                );
                                              case ButtonState.playing:
                                                return IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  icon: Icon(Icons.pause_circle_filled),
                                                  color: Colors.black,
                                                  iconSize: 25.0,
                                                  onPressed: audioManager!.pause,
                                                );
                                            }
                                          },
                                        ):Container(),



                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3,)

                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top:-10.0,
                          right:-15.0,
                          child: new IconButton(
                              icon: Icon(Icons.cancel,color: Colors.black,size: 22,),
                              onPressed: () {

                                setState(() {
                                print("index:"+index.toString());
                                videoList.remove(videoList[index]);

                                });

                              }),
                        ),
                      ],
                    );
                    // :return Container();
                  }):Container(),

              SizedBox(
                height: 30.h,
              ),
              Center(
                child: CommonElevatedButton(
                  onTap: checkEmptyField,
                  context: context,
                  lableText: txtSubmit,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
  checkEmptyField() {
    if (biographySController.text.isEmpty) {
      return;
    } else if (addressController.text.isEmpty) {
      return;
    }
  }
}
class videoData{
  File? videourl;
  bool isPlaying=false;
  videoData({this.videourl,required this.isPlaying});
}
