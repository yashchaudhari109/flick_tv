import 'package:go_router/go_router.dart';
import 'package:flick_tv/data/models/video_model.dart';
import 'package:flick_tv/presentation/pages/home_page.dart';
import 'package:flick_tv/presentation/pages/video_player_page.dart';

class AppRouter {
  // Define route names to avoid using hardcoded strings.
  static const String homeRoute = '/';
  static const String playerRoute = '/player';

  // The GoRouter configuration.
  static final GoRouter router = GoRouter(
    initialLocation: homeRoute, // The app starts at the home page.
    routes: [
      // Route for the Home Page.
      GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomePage(),
      ),
      // Route for the Video Player Page.
      GoRoute(
        path: playerRoute,
        builder: (context, state) {
          final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          final List<VideoModel> videos = args['videos'] as List<VideoModel>;
          final int initialIndex = args['initialIndex'] as int;

          return VideoPlayerPage(
            videos: videos,
            initialIndex: initialIndex,
          );
        },
      ),
    ],
  );
}