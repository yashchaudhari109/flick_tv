import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flick_tv/data/models/video_model.dart';

class SingleVideoPlayerItem extends StatefulWidget {
  final VideoModel video;
  final bool isPlaying;
  const SingleVideoPlayerItem({
    super.key,
    required this.video,
    required this.isPlaying,
  });

  @override
  State<SingleVideoPlayerItem> createState() => _SingleVideoPlayerItemState();
}

class _SingleVideoPlayerItemState extends State<SingleVideoPlayerItem> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: widget.isPlaying,
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          showControls: true,
          enableSkips: false,
          enableFullscreen: false,
          controlBarColor: Colors.black26,
        ),
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        widget.video.videoUrl,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant SingleVideoPlayerItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
          controller: _controller,
        ),
      ),
    );
  }
}