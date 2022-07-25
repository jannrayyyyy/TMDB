import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/trending_cubit/trending_cubit.dart';
import '../../primary_widget/custom_text_widget.dart';
import '../important/movie_display_result.dart';

class TrendingDisplayWidget extends StatelessWidget {
  const TrendingDisplayWidget({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (content, state) {
        if (state is TrendingLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: CustomTextWidget(
                      text: 'Trending',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MovieDisplayResult(movies: state.movies)
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
