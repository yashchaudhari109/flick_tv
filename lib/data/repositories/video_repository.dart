import 'package:flick_tv/data/models/video_model.dart';
import 'package:flick_tv/data/providers/local_data_provider.dart';

// The repository provides a clean API for data access to the rest of the app.
class VideoRepository {
  final LocalDataProvider _localDataProvider;

  // The repository depends on a data provider. This is an example of Dependency Injection.
  VideoRepository({LocalDataProvider? localDataProvider})
      : _localDataProvider = localDataProvider ?? LocalDataProvider();

  // The primary method to fetch the list of video categories.
  Future<List<VideoCategory>> getVideoCategories() async {
    return await _localDataProvider.loadVideos();
  }

  // A helper method to get a flat list of all videos from all categories.
  Future<List<VideoModel>> getAllVideos() async {
    final categories = await _localDataProvider.loadVideos();
    // Use expand() to flatten the list of lists into a single list of videos.
    return categories.expand((category) => category.videos).toList();
  }
}