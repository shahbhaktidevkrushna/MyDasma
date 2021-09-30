import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

late ListViewHandelItemState pageState;

class ListViewHandelItem extends StatefulWidget {
  @override
  ListViewHandelItemState createState() {
    pageState = ListViewHandelItemState();
    return pageState;
  }
}

class ListViewHandelItemState extends State<ListViewHandelItem> {
  List<String> items = <String>[];
  List<String> tests = <String>[];
  List<videoData> videoList=<videoData>[];
  //List<videoData> videoList=<videoData>[];
  //     .generate(7, (index) {
  //   return "Item - $index";
  // });

  final teController = TextEditingController(
    text: "good",
  );

  @override
  void dispose() {
    teController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Handle Items")),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 70,
              alignment: Alignment(0, 0),
              color: Colors.orange,
              child: Text(
                "To remove an item, swipe the tile to the right or tap the trash icon.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  icon: Icon(
                    Icons.camera_alt,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.audio,allowMultiple: true);
                    List<File> files = result!.paths.map((path) => File(path!)).toList();

                    setState(() {
                      for(int i=0;i<files.length;i++){
                        tests.add("value:"+i.toString());
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
          Expanded(
            child: ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                final item = videoList[index];
                return ListTile(
                  title: Text(item.videourl!.path.split('/').last),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      setState(() {
                        videoList.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 5,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[
                Text("Inser Data:"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: teController,
                      onSubmitted: (text) {
                        setState(() {
                          if (teController.text != "") {
                            items.add(teController.text);
                          }
                        });
                        teController.clear();
                      },
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("Insert"),
                  onPressed: () {
                    setState(() {
                      if (teController.text != "") {
                        items.add(teController.text);
                      }
                    });
                    teController.clear();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class videoData{
  File? videourl;
  bool isPlaying=false;
  videoData({this.videourl,required this.isPlaying});
}