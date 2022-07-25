import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/theme/themedata.dart';
import '../../../../domain/entities/video_entity.dart';
import '../../primary_widget/custom_text_widget.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final List<VideoEntity> videos;
  const YoutubePlayerWidget({
    Key? key,
    required this.videos,
  }) : super(key: key);

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController ytController;

  @override
  void initState() {
    super.initState();
    ytController = YoutubePlayerController(
        initialVideoId: widget.videos[0].key,
        flags: const YoutubePlayerFlags());
  }

  @override
  void dispose() {
    ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: ytController,
          showVideoProgressIndicator: true,
          progressColors: const ProgressBarColors(),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < widget.videos.length; i++)
                        SizedBox(
                          width: width,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ytController.load(widget.videos[i].key);
                                  ytController.play();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: CachedNetworkImage(
                                    width: 150,
                                    imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: widget.videos[i].key,
                                      quality: ThumbnailQuality.high,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomTextWidget(
                                    text: widget.videos[i].title,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
