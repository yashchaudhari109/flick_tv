import 'package:flutter/material.dart';
import 'package:flick_tv/core/constants/app_constants.dart';
import 'package:flick_tv/data/models/video_model.dart';

// An enum to define the style of the card, making it reusable for different carousels.
enum ThumbnailStyle { portrait, landscape }

class VideoThumbnailCard extends StatelessWidget {
  final VideoModel video;
  final VoidCallback onTap;
  final ThumbnailStyle style;

  const VideoThumbnailCard({
    super.key,
    required this.video,
    required this.onTap,
    this.style = ThumbnailStyle.portrait,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = style == ThumbnailStyle.portrait
        ? AppConstants.portraitThumbnailWidth
        : AppConstants.landscapeThumbnailWidth;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.symmetric(horizontal: AppConstants.kPaddingS),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.kRadiusM),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                video.thumbnailUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[800],
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.error_outline, color: Colors.white54),
                  );
                },
              ),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 1.0],
                  ),
                ),
              ),

              Positioned(
                bottom: AppConstants.kPaddingS,
                left: AppConstants.kPaddingS,
                right: AppConstants.kPaddingS,
                child: Text(
                  video.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    shadows: [ // Add a shadow for better readability
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}