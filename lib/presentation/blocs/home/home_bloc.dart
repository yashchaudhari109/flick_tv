import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flick_tv/data/repositories/video_repository.dart';
import 'package:flick_tv/presentation/blocs/home/home_event.dart';
import 'package:flick_tv/presentation/blocs/home/home_state.dart';

// The HomeBloc is responsible for managing the state of the HomePage.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final VideoRepository _videoRepository;

  // The BLoC takes a VideoRepository as a dependency.
  HomeBloc(this._videoRepository) : super(HomeInitial()) {
    // Register the event handler for the LoadHomeData event.
    on<LoadHomeData>(_onLoadHomeData);
  }

  // This is the event handler function for the LoadHomeData event.
  Future<void> _onLoadHomeData(
      LoadHomeData event,
      Emitter<HomeState> emit,
      ) async {
    try {
      // 1. Emit the HomeLoading state to inform the UI that data is being fetched.
      emit(HomeLoading());

      // 2. Fetch the video categories from the repository.
      final categories = await _videoRepository.getVideoCategories();

      // 3. If successful, emit the HomeLoaded state with the fetched data.
      emit(HomeLoaded(categories));
    } catch (e) {
      // 4. If an error occurs, emit the HomeError state with an error message.
      emit(HomeError(e.toString()));
    }
  }
}