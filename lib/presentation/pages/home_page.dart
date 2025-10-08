import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flick_tv/core/navigation/app_router.dart';
import 'package:flick_tv/data/repositories/video_repository.dart';
import 'package:flick_tv/presentation/blocs/home/home_bloc.dart';
import 'package:flick_tv/presentation/blocs/home/home_event.dart';
import 'package:flick_tv/presentation/blocs/home/home_state.dart';
import 'package:flick_tv/presentation/widgets/carousel_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Create an instance of HomeBloc and provide it to the widget tree.
      create: (context) => HomeBloc(
        VideoRepository(),
      )..add(LoadHomeData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flick TV'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            // -- Loading State --
            if (state is HomeLoading || state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            // -- Loaded State --
            if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];

                  // Define a list of styles to cycle through
                  const carouselTypes = [
                    CarouselType.landscapeFeatured,
                    CarouselType.portrait,
                  ];
                  // Assign a style based on the row's index
                  final type = carouselTypes[index % carouselTypes.length];
                  return CarouselRow(
                    category: category,
                    type: type,
                    onVideoTap: (videos, videoIndex) {
                      GoRouter.of(context).push(
                        AppRouter.playerRoute,
                        extra: {
                          'videos': videos,
                          'initialIndex': videoIndex,
                        },
                      );
                    },
                  );
                },
              );
            }
            // -- Error State --
            if (state is HomeError) {
              return Center(
                child: Text(
                  'Failed to load content: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            // -- Fallback for any other state --
            return const Center(child: Text('Something went wrong.'));
          },
        ),
      ),
    );
  }
}