import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
class  VideoLearning extends StatefulWidget {
  String ? id;
  VideoLearning ({super.key, required this.id});
  @override
  State<VideoLearning> createState() =>_VideoLearningState();
}
class _VideoLearningState extends State<VideoLearning> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  final double _volume = 100;
  final bool _muted = false;
  bool _isPlayerReady = false;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.id!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),

    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener(){
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose (){
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: YoutubePlayerBuilder(
        onEnterFullScreen: () {},
        player:  YoutubePlayer(
          bottomActions: [
            const SizedBox(width: 14.0,),
            CurrentPosition(),
            const SizedBox(width: 8.0,),
            ProgressBar(
              isExpanded: true,
            ),
            RemainingDuration(),
            const PlaybackSpeedButton(),
          ],
          aspectRatio: 16/9,
          onReady: () {
            _isPlayerReady = true;
          },
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          controller: _controller,
        ),
        builder: (context, player) {
          return player;
        },
      ),
    );
  }
}
