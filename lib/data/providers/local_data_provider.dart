import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flick_tv/core/constants/asset_constants.dart';
import 'package:flick_tv/data/models/video_model.dart';

class LocalDataProvider {
  // This method reads the local mock.json file, parses it, and returns a list of VideoCategory.
  Future<List<VideoCategory>> loadVideos() async {
    try {
      // Load the JSON string from the asset bundle.
      final jsonString = await rootBundle.loadString(AssetConstants.mockDataPath);

      // Decode the JSON string into a Map.
      final jsonResponse = json.decode(jsonString) as Map<String, dynamic>;

      // Extract the list of categories.
      final categoriesList = jsonResponse['categories'] as List;

      // Map the list of dynamic objects to a list of VideoCategory models.
      return categoriesList
          .map((categoryJson) => VideoCategory.fromJson(categoryJson))
          .toList();
    } catch (e) {
      // If any error occurs during file reading or parsing, throw an exception.
      throw Exception('Failed to load video data: $e');
    }
  }
}