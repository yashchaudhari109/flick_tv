import 'package:equatable/equatable.dart';

// The VideoModel represents the structure of a single video item from the JSON data.
class VideoModel extends Equatable {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String videoUrl;

  const VideoModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
  });

  // A factory constructor to create a VideoModel instance from a JSON map.
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      videoUrl: json['videoUrl'] as String,
    );
  }

  // The properties that will be used for equality checking.
  @override
  List<Object?> get props => [id, title, thumbnailUrl, videoUrl];
}


class VideoCategory extends Equatable {
  final String name;
  final List<VideoModel> videos;

  const VideoCategory({required this.name, required this.videos});

  factory VideoCategory.fromJson(Map<String, dynamic> json) {
    final videos = (json['videos'] as List)
        .map((videoJson) => VideoModel.fromJson(videoJson))
        .toList();

    return VideoCategory(
      name: json['name'] as String,
      videos: videos,
    );
  }

  @override
  List<Object?> get props => [name, videos];
}