import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dasma/extras/commonWidgets/CommonAppbar.dart';
import 'package:my_dasma/extras/constants/AppColor.dart';
import 'package:my_dasma/extras/constants/AppImages.dart';
import 'package:my_dasma/extras/constants/StringConstant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaVideoListPage extends StatefulWidget {
  const MediaVideoListPage({Key? key}) : super(key: key);

  @override
  _MediaVideoListPageState createState() => _MediaVideoListPageState();
}

class _MediaVideoListPageState extends State<MediaVideoListPage> {

  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CommonAppBar(
        appBar: AppBar(),
        title: txtHome,
        AppBarBackground:colorPurple,
        isLeading: false,
        // isDrawer: true,
        textColor: Colors.white,

      ),

      body:SafeArea(
        child:  Container(
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
                      //Text("Hello"),

                      /*YoutubePlayerBuilder(
                      onExitFullScreen: () {
                    // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
              },
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  topActions: <Widget>[
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        _controller.metadata.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      onPressed: () {
                        log('Settings Tapped!');
                      },
                    ),
                  ],
                  onReady: () {
                    _isPlayerReady = true;
                  },
                  onEnded: (data) {
                    _controller
                        .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                    _showSnackBar('Next Video Started!');
                  },
                ),
                builder: (context, player) => Scaffold(
                  appBar: AppBar(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Image.asset(
                        'assets/ypf.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: const Text(
                      'Youtube Player Flutter',
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.video_library),
                        *//*onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => VideoList(),
                          ),
                        ),*//*

                        onPressed: (){

                        },
                      ),
                    ],
                  ),
                  body: ListView(
                    children: [
                      player,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _space,
                            _text('Title', _videoMetaData.title),
                            _space,
                            _text('Channel', _videoMetaData.author),
                            _space,
                            _text('Video Id', _videoMetaData.videoId),
                            _space,
                            Row(
                              children: [
                                _text(
                                  'Playback Quality',
                                  _controller.value.playbackQuality ?? '',
                                ),
                                const Spacer(),
                                _text(
                                  'Playback Rate',
                                  '${_controller.value.playbackRate}x  ',
                                ),
                              ],
                            ),
                            _space,
                            TextField(
                              enabled: _isPlayerReady,
                              controller: _idController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter youtube \<video id\> or \<link\>',
                                fillColor: Colors.blueAccent.withAlpha(20),
                                filled: true,
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.blueAccent,
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () => _idController.clear(),
                                ),
                              ),
                            ),
                            _space,
                            Row(
                              children: [
                                _loadCueButton('LOAD'),
                                const SizedBox(width: 10.0),
                                _loadCueButton('CUE'),
                              ],
                            ),
                            _space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.skip_previous),
                                  onPressed: _isPlayerReady
                                      ? () => _controller.load(_ids[
                                  (_ids.indexOf(_controller.metadata.videoId) -
                                      1) %
                                      _ids.length])
                                      : null,
                                ),
                                IconButton(
                                  icon: Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                  onPressed: _isPlayerReady
                                      ? () {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                    setState(() {});
                                  }
                                      : null,
                                ),
                                IconButton(
                                  icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                                  onPressed: _isPlayerReady
                                      ? () {
                                    _muted
                                        ? _controller.unMute()
                                        : _controller.mute();
                                    setState(() {
                                      _muted = !_muted;
                                    });
                                  }
                                      : null,
                                ),
                                FullScreenButton(
                                  controller: _controller,
                                  color: Colors.blueAccent,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.skip_next),
                                  onPressed: _isPlayerReady
                                      ? () => _controller.load(_ids[
                                  (_ids.indexOf(_controller.metadata.videoId) +
                                      1) %
                                      _ids.length])
                                      : null,
                                ),
                              ],
                            ),
                            _space,
                            Row(
                              children: <Widget>[
                                const Text(
                                  "Volume",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Expanded(
                                  child: Slider(
                                    inactiveColor: Colors.transparent,
                                    value: _volume,
                                    min: 0.0,
                                    max: 100.0,
                                    divisions: 10,
                                    label: '${(_volume).round()}',
                                    onChanged: _isPlayerReady
                                        ? (value) {
                                      setState(() {
                                        _volume = value;
                                      });
                                      _controller.setVolume(_volume.round());
                                    }
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            _space,
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: _getStateColor(_playerState),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _playerState.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/

                      SizedBox(height: 20.0.h,),

                     /* YoutubePlayer(
                        controller: _controller,
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(isExpanded: true),

                        ],
                      ),*/

                      /*YoutubeValueBuilder(
                        controller: _controller, // This can be omitted, if using `YoutubePlayerControllerProvider`
                        builder: (context, value) {
                          return IconButton(
                            icon: Icon(
                              value.playerState == PlayerState.playing
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            onPressed: value.isReady
                                ? () {
                              value.playerState == PlayerState.playing
                                  ? context.ytController.pause()
                                  : context.ytController.play();
                            }
                                : null,
                          );
                        },
                      ),*/

                     /* YoutubePlayer(
                        context: context,
                        initialVideoId: "iLnmTe5Q2Qw",
                        flags: YoutubePlayerFlags(
                          autoPlay: true,
                          showVideoProgressIndicator: true,
                        ),
                        videoProgressIndicatorColor: Colors.amber,
                        progressColors: ProgressColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                        onPlayerInitialized: (controller) {
                          _controller = controller;
                          _controller.addListener(listener);
                        },
                      ),*/

                      YoutubePlayer(controller: _controller),



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
      ),
    );


   /* return Scaffold(
      body: Center(child: Text("Hello")),
    );*/
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
          if (_idController.text.isNotEmpty) {
            var id = YoutubePlayer.convertUrlToId(
              _idController.text,
            ) ??
                '';
            if (action == 'LOAD') _controller.load(id);
            if (action == 'CUE') _controller.cue(id);
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            _showSnackBar('Source can\'t be empty!');
          }
        }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

}
