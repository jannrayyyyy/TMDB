import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../../../dependency_injection.dart';
import '../../../../core/constant/api_constant.dart';
import '../../../../core/theme/themedata.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../cubit/cast_cubit/cast_cubit.dart';
import '../../../cubit/movie_detail_cubit/movie_detail_cubit.dart';
import '../../../cubit/video_cubit/video_cubit.dart';
import '../../../pages/detailpage.dart';
import '../../primary_widget/custom_text_widget.dart';
import 'youtube_player.dart';

class ModalBuilderWidget extends StatefulWidget {
  final MovieEntity movie;
  const ModalBuilderWidget({Key? key, required this.movie}) : super(key: key);

  @override
  State<ModalBuilderWidget> createState() => _ModalBuilderWidgetState();
}

class _ModalBuilderWidgetState extends State<ModalBuilderWidget> {
  void toDetailScreen(int id) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<MovieDetailCubit>(
                      create: (context) =>
                          sl<MovieDetailCubit>()..getMovieDetail(id: id),
                    ),
                    BlocProvider<VideoCubit>(
                      create: (context) => sl<VideoCubit>()..getVideo(id),
                    ),
                    BlocProvider<CastCubit>(
                      create: (context) => sl<CastCubit>()..getCast(id),
                    ),
                  ],
                  child: DetailPage(id: id, movie: widget.movie),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        color: bg,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: CustomTextWidget(
                text: widget.movie.title.toString(),
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    '$BASE_IMAG_URL${widget.movie.backdropPath}',
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(width: 1.5, color: Colors.white),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    toDetailScreen(widget.movie.id!);
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      padding: const EdgeInsets.all(7),
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: const Center(
                        child: CustomTextWidget(
                            text: 'Details', color: Colors.white),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: sl<VideoCubit>()..getVideo(widget.movie.id!),
                          child: BlocBuilder<VideoCubit, VideoState>(
                            builder: (context, state) {
                              if (state is VideoLoaded) {
                                return YoutubePlayerWidget(
                                    videos: state.videos);
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: const Iconify(
                      Ic.round_play_arrow,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}
