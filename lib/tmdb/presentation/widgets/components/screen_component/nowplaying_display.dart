import '../../../cubit/now_playing_cubit/now_playing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../primary_widget/custom_text_widget.dart';
import '../important/movie_display_result.dart';

class NowplayingDisplayWidget extends StatelessWidget {
  const NowplayingDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (content, state) {
        if (state is NowPlayingLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 125,
                      height: 50,
                      child: Center(
                        child: CustomTextWidget(
                          text: 'Now Playing',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MovieDisplayResult(movies: state.movies)
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
