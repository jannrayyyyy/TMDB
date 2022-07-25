import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../core/constant/api_constant.dart';
import '../../core/theme/themedata.dart';
import '../../domain/entities/movie_entity.dart';
import '../cubit/movie_detail_cubit/movie_detail_cubit.dart';
import '../widgets/components/screen_component/cast_display.dart';
import '../widgets/primary_widget/custom_text_widget.dart';
import '../widgets/primary_widget/watch_trailer_widget.dart';

class DetailPage extends StatefulWidget {
  final int id;
  final MovieEntity movie;
  const DetailPage({Key? key, required this.id, required this.movie})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isDetail = true;
  bool isCast = false;
  bool isDetailColor = true;
  bool isCastColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
        if (state is MovieDetailLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        state.movieDetail.backdropPath.isNotEmpty
                            ? BASE_IMAG_URL + state.movieDetail.backdropPath
                            : NO_IMAGE_LINK,
                      ),
                      opacity: 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isCast) {
                              isDetail = true;
                              isDetailColor = true;
                              isCastColor = false;
                              isCast = false;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5,
                                color:
                                    isDetailColor ? Colors.red : Colors.white),
                            borderRadius: BorderRadius.circular(8),
                            color: isDetailColor ? Colors.red : Colors.white,
                          ),
                          child: CustomTextWidget(
                            text: 'Details',
                            fontSize: 15,
                            color: isDetailColor ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isDetail) {
                              isCast = true;
                              isCastColor = true;
                              isDetailColor = false;
                              isDetail = false;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: isCastColor ? Colors.red : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: isCastColor ? Colors.red : Colors.white,
                          ),
                          child: CustomTextWidget(
                            text: 'Casts',
                            fontSize: 15,
                            color: isCastColor ? Colors.white : Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                isDetail
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: CustomTextWidget(
                              alignment: TextAlign.center,
                              text: state.movieDetail.title,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                              child: CustomTextWidget(
                                  text: '"${state.movieDetail.tagline}"',
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 2, 12, 5),
                            child: Row(
                              children: [
                                SmoothStarRating(
                                  allowHalfRating: false,
                                  rating: state.movieDetail.voteAverage / 2,
                                  color: Colors.white,
                                  size: 25,
                                  borderColor: Colors.red,
                                  spacing: 0.0,
                                ),
                                const SizedBox(width: 40),
                                CustomTextWidget(
                                  text:
                                      '${DateTime.parse(state.movieDetail.releaseDate).year}',
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 16),
                                CustomTextWidget(
                                  text: state.movieDetail.adult ? '18+' : '13+',
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 16),
                                CustomTextWidget(
                                  text: '${state.movieDetail.runtime}m',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 10, bottom: 10),
                            child: const CustomTextWidget(
                              text: 'OVERVIEW',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomTextWidget(
                              text: state.movieDetail.overview,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: state.movieDetail.genres.map((genre) {
                                  return Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5, color: Colors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: CustomTextWidget(
                                      text: genre.name!,
                                      color: Colors.white,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(15, 25, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: const WatchTrailerDisplayWidget()),
                          const SizedBox(height: 30)
                        ],
                      )
                    : const SizedBox.shrink(),
                isCast
                    ? CastDisplayWidget(
                        id: widget.id,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        } else if (state is MovieDetailLoading) {
          return const SizedBox(
              child: CustomTextWidget(
            text: 'error',
          ));
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
