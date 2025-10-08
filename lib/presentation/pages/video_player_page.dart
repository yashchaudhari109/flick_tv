import 'package:flutter/material.dart';
import 'package:flick_tv/data/models/video_model.dart';
import 'package:flick_tv/presentation/widgets/single_video_player_item.dart';

class VideoPlayerPage extends StatefulWidget {
  final List<VideoModel> videos;
  final int initialIndex;

  const VideoPlayerPage({
    super.key,
    required this.videos,
    required this.initialIndex,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.videos.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return SingleVideoPlayerItem(
            key: Key(widget.videos[index].id),
            video: widget.videos[index],
            isPlaying: index == _currentPage,
          );
        },
      ),
    );
  }
}