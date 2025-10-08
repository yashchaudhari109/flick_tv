import 'package:equatable/equatable.dart';
import 'package:flick_tv/data/models/video_model.dart';

// The base abstract class for all possible states of the Home Page.
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// Represents the initial state of the Home Page, before any data is fetched.
class HomeInitial extends HomeState {}

// Represents the state where the data is currently being fetched.
// The UI will show a loading indicator when this state is emitted.
class HomeLoading extends HomeState {}

// Represents the state where the video categories have been successfully loaded.
// It holds the data that the UI needs to display.
class HomeLoaded extends HomeState {
  final List<VideoCategory> categories;

  const HomeLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

// Represents the state where an error occurred while fetching the data.
// It holds an error message that can be displayed to the user.
class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}