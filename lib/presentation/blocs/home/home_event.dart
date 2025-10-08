import 'package:equatable/equatable.dart';

// The base class for all home-related events.
// Extending Equatable is good practice for consistent behavior.
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// This event is dispatched when the home page is first loaded.
// Its purpose is to trigger the BLoC to fetch the necessary video data.
class LoadHomeData extends HomeEvent {}