import '../../../../core/constant/api_constant.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../cubit/search_cubit/search_cubit.dart';
import '../../primary_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../../../dependency_injection.dart';
import '../../../cubit/cast_cubit/cast_cubit.dart';
import '../../../cubit/movie_detail_cubit/movie_detail_cubit.dart';
import '../../../cubit/video_cubit/video_cubit.dart';
import '../../../pages/detailpage.dart';

class SearchDisplayWidget extends StatefulWidget {
  final List<MovieEntity> movie;
  const SearchDisplayWidget({Key? key, required this.movie}) : super(key: key);

  @override
  State<SearchDisplayWidget> createState() => _SearchDisplayWidgetState();
}

class _SearchDisplayWidgetState extends State<SearchDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is Searchloading) {
          return Column(children: const [
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
          ]);
        } else if (state is SearchError) {
          Center(
              child: CustomTextWidget(
            fontSize: 30,
            color: Colors.white,
            text: state.msg,
          ));
        }

        if (state is SearchEmpty) {
          return Center(
              child: CustomTextWidget(
            fontSize: 30,
            color: Colors.white,
            text: state.empty,
          ));
        } else if (state is SearchLoaded) {
          return ListView.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider<MovieDetailCubit>(
                            create: (context) => sl<MovieDetailCubit>()
                              ..getMovieDetail(id: state.movies[index].id!),
                          ),
                          BlocProvider<VideoCubit>(
                            create: (context) => sl<VideoCubit>()
                              ..getVideo(state.movies[index].id!),
                          ),
                          BlocProvider<CastCubit>(
                            create: (context) => sl<CastCubit>()
                              ..getCast(state.movies[index].id!),
                          ),
                        ],
                        child: DetailPage(
                          id: state.movies[index].id!,
                          movie: state.movies[index],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(7),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      color: Colors.grey.withAlpha(70),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            child: SizedBox(
                              height: 150,
                              child: Image.network(
                                (state.movies[index].posterPath ?? '')
                                        .isNotEmpty
                                    ? '$BASE_IMAG_URL${state.movies[index].posterPath}'
                                    : NO_IMAGE_LINK,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 100,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            margin: const EdgeInsets.all(7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 11.0),
                                  child: CustomTextWidget(
                                    text: state.movies[index].title ?? '',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    maxLine: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 17, top: 7),
                                  child: SizedBox(
                                    child: CustomTextWidget(
                                      text: state.movies[index].overview ?? '',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      maxLine: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget(
                                      text:
                                          state.movies[index].releaseDate ?? '',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 16, right: 7),
                                      child: const Iconify(
                                        Ic.baseline_star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    CustomTextWidget(
                                      text: state.movies[index].voteAverage
                                          .toString(),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
