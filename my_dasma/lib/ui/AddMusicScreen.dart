import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'UserDashboard.dart';

class AddMusicScreen extends StatefulWidget {
  @override
  _AddMusicScreenState createState() => _AddMusicScreenState();
}

class _AddMusicScreenState extends State<AddMusicScreen> {
  bool _isPlaying = false;
  AudioPlayer? audioPlayer;
  String currentTime = "0:00:00";
  String completeTime = "0:00:00";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer!.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });
    audioPlayer!.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  playAudioFromLocalStorage(path) async {
    int response = await audioPlayer!.play(
      path,
      isLocal: true,
    );
    if (response == 1) {
      // success

    } else {
      print('Some error occured in playing from storage!');
    }
  }

  Future<int> _getDuration() async {
    int duration = await Future.delayed(
        Duration(seconds: 2), () => audioPlayer!.getDuration());
    return duration;
  }

  getLocalFileDuration() {
    return FutureBuilder<int>(
        future: _getDuration(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Text(
              'sample.mp3 duration is: ${Duration(milliseconds: snapshot.data!.toInt())}');
        });
  }

  pauseAudio() async {
    int response = await audioPlayer!.pause();
    if (response == 1) {
      // success

    } else {
      print('Some error occured in pausing');
    }
  }

  stopAudio() async {
    int response = await audioPlayer!.stop();
    if (response == 1) {
      // success

    } else {
      print('Some error occured in stopping');
    }
  }

  resumeAudio() async {
    int response = await audioPlayer!.resume();
    if (response == 1) {
      // success

    } else {
      print('Some error occured in resuming');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          appBar: AppBar(),
          title: txtManageMenu,
          AppBarBackground: Colors.black,
          isLeading: true,
          textColor: Colors.white,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     RaisedButton(
                    //       onPressed: () {
                    //         if (_isPlaying == true) {
                    //           pauseAudio();
                    //           setState(() {
                    //             _isPlaying = false;
                    //           });
                    //         } else {
                    //           resumeAudio();
                    //           setState(() {
                    //             _isPlaying = true;
                    //           });
                    //         }
                    //       },
                    //       child:
                    //       Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                    //       color: Colors.blue,
                    //     ),
                    //     RaisedButton(
                    //       onPressed: () {
                    //         stopAudio();
                    //         setState(() {
                    //           _isPlaying = false;
                    //         });
                    //       },
                    //       child: Icon(Icons.stop),
                    //       color: Colors.blue,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.audio);
                      PlatformFile? file;
                      if (result != null) {
                        file = result.files.first;
                      }

                      setState(() {
                        _isPlaying = true;
                      });
                      playAudioFromLocalStorage(file!.path);
                    },
                    child: Text(
                      'Load Audio File',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              // getLocalFileDuration(),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 260,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            _isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            if (_isPlaying) {
                              audioPlayer!.pause();

                              setState(() {
                                _isPlaying = false;
                              });
                            } else {
                              audioPlayer!.resume();
                              setState(() {
                                _isPlaying = true;
                              });
                            }
                          }),
                      Expanded(
                        child: ProgressBar(
                          progressBarColor: Colors.black,
                          thumbColor: Colors.black,
                          baseBarColor: Colors.black.withOpacity(0.24),
                          progress:parseDuration(currentTime),
                          timeLabelLocation: TimeLabelLocation.sides,
                          total: parseDuration(completeTime),
                          onSeek: (duration) {
                            audioPlayer!.seek(duration);
                          },
                        ),
                      ),
                      SizedBox(width: 10.h,)
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.stop,
                      //     color: Colors.black,
                      //     size: 25,
                      //   ),
                      //   onPressed: () {
                      //     audioPlayer!.stop();
                      //
                      //     setState(() {
                      //       _isPlaying = false;
                      //     });
                      //   },
                      // ),
                      // Text(
                      //   "   " + currentTime,
                      //   style: TextStyle(fontWeight: FontWeight.w700),
                      // ),
                      // Text(" / "),
                      // Text(
                      //   completeTime,
                      //   style: TextStyle(fontWeight: FontWeight.w300),
                      // ),

                    ],
                  )),
              // Container(
              //   width: 180.h,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: ProgressBar(
              //           progress:parseDuration(currentTime),
              //
              //           total: parseDuration(completeTime),
              //           onSeek: (duration) {
              //             audioPlayer!.seek(duration);
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
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
}

class CategoryList {
  final String title;

  CategoryList(this.title);
}

class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });

  final Duration progress;
  final Duration buffered;
  final Duration? total;
}
