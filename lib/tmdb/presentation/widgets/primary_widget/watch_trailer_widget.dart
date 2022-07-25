import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';
import '../../cubit/video_cubit/video_cubit.dart';
import '../components/important/youtube_player.dart';
import 'custom_text_widget.dart';

class WatchTrailerDisplayWidget extends StatelessWidget {
  const WatchTrailerDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded && state.videos.iterator.moveNext()) {
          final videos = state.videos;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: sl<VideoCubit>(),
                    child: YoutubePlayerWidget(videos: videos),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red),
              height: 35,
              width: 200,
              child: const Center(
                  child: CustomTextWidget(
                text: 'Watch Trailer',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
