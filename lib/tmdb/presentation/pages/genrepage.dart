import '../../core/theme/themedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependency_injection.dart';
import '../../core/constant/api_constant.dart';
import '../cubit/cast_cubit/cast_cubit.dart';
import '../cubit/genre_cubit/genre_cubit.dart';
import '../cubit/movie_detail_cubit/movie_detail_cubit.dart';
import '../cubit/video_cubit/video_cubit.dart';
import 'detailpage.dart';

class GenrePage extends StatefulWidget {
  final int id;
  const GenrePage({Key? key, required this.id}) : super(key: key);

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  void initState() {
    context.read<GenreCubit>().chooseGenre(id: 28);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider<GenreCubit>(
              create: (context) => sl<GenreCubit>()..chooseGenre(id: widget.id),
              child: BlocBuilder<GenreCubit, GenreState>(
                  builder: (context, state) {
                if (state is GenreLoaded) {
                  return Column(
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          child: Image.network(
                            '$BASE_IMAG_URL${state.movies[0].backdropPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Wrap(
                          children: state.movies.map((movie) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider<MovieDetailCubit>(
                                          create: (context) =>
                                              sl<MovieDetailCubit>()
                                                ..getMovieDetail(id: movie.id!),
                                        ),
                                        BlocProvider<VideoCubit>(
                                          create: (context) => sl<VideoCubit>()
                                            ..getVideo(movie.id!),
                                        ),
                                        BlocProvider<CastCubit>(
                                          create: (context) => sl<CastCubit>()
                                            ..getCast(movie.id!),
                                        ),
                                      ],
                                      child: DetailPage(
                                        id: movie.id!,
                                        movie: movie,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(5, 7, 5, 7),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    movie.posterPath != null
                                        ? '$BASE_IMAG_URL${movie.posterPath}'
                                        : NO_IMAGE_LINK,
                                    fit: BoxFit.fill,
                                    height: 170,
                                    width: 120,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                } else if (state is GenreLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const SizedBox.shrink();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
