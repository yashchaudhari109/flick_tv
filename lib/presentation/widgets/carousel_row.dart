import 'package:flutter/material.dart';
import 'package:flick_tv/core/constants/app_constants.dart';
import 'package:flick_tv/data/models/video_model.dart';
import 'package:flick_tv/presentation/widgets/video_thumbnail_card.dart';

// Enum to define the visual style of the carousel
enum CarouselType {
  portrait,
  landscapeFeatured,
}

class CarouselRow extends StatelessWidget {
  final VideoCategory category;
  final Function(List<VideoModel>, int) onVideoTap;
  final CarouselType type;

  const CarouselRow({
    super.key,
    required this.category,
    required this.onVideoTap,
    this.type = CarouselType.portrait, // Default to portrait style
  });

  @override
  Widget build(BuildContext context) {
    final double carouselHeight = type == CarouselType.portrait
        ? AppConstants.portraitThumbnailHeight
        : AppConstants.landscapeThumbnailHeight;

    final ThumbnailStyle thumbnailStyle = type == CarouselType.portrait
        ? ThumbnailStyle.portrait
        : ThumbnailStyle.landscape;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppConstants.kPaddingM,
            AppConstants.kPaddingL, // More top padding for separation
            AppConstants.kPaddingM,
            AppConstants.kPaddingM, // More bottom padding
          ),
          child: Text(
            category.name,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20),
          ),
        ),
        SizedBox(
          height: carouselHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.videos.length,
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.kPaddingS),
            itemBuilder: (context, index) {
              final video = category.videos[index];
              return VideoThumbnailCard(
                video: video,
                style: thumbnailStyle,
                onTap: () => onVideoTap(category.videos, index),
              );
            },
          ),
        ),
      ],
    );
  }
}