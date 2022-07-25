import '../../../cubit/up_coming_cubit/up_coming_cubit.dart';
import '../important/movie_display_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../primary_widget/custom_text_widget.dart';

class UpcomingDisplayWidget extends StatefulWidget {
  const UpcomingDisplayWidget({Key? key}) : super(key: key);

  @override
  State<UpcomingDisplayWidget> createState() => _UpcomingDisplayWidgetState();
}

class _UpcomingDisplayWidgetState extends State<UpcomingDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpComingCubit, UpComingState>(builder: (context, state) {
      if (state is UpComingLoaded) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 120,
                height: 50,
                child: Center(
                  child: CustomTextWidget(
                    text: 'Up Coming',
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
    });
  }
}
