import 'dart:io';

//import 'package:file_picker/file_picker.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/commonWidgets/CommonBusinessButton.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';


class SingerAudioSelection extends StatefulWidget {
  const SingerAudioSelection({Key? key}) : super(key: key);

  @override
  _SingerAudioSelectionState createState() => _SingerAudioSelectionState();
}

class _SingerAudioSelectionState extends State<SingerAudioSelection> {

  List<XFile>? images = [];
  List<File>? imageFileArray = [];
  var _image;
  var imagePicker;
  var picked;
  List<String> audioFileList = [];
  bool _play = false;


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
            AppBarBackground: blackDark,
            isLeading: true,
            textColor: Colors.white,
          ),

          body: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 32.h,),

              /*  Text(txtAudioRecordings,
                  style: TextStyle(fontSize: 18.sp),),*/

                Center(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(primary: blackDark),
                      icon: Icon(
                        Icons.camera_alt,
                        size: 20.0.r,
                      ),
                      onPressed: () async {
                        picked = await FilePicker.platform.pickFiles(type: FileType.audio);

                        if (picked == null){
                          Center(child: CircularProgressIndicator());
                        } else {
                          print(picked.files.first.name != null && picked.files.first.name != ""?picked.files.first.name:"");
                        }
                      },
                      label: Text(txtSelectAudios,
                          style: TextStyle(color: Colors.white, fontSize: 16.0))),
                ),



              ],
            ),
          ),
        ));
  }
}
