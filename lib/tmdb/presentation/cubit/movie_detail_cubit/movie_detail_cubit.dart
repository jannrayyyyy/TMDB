import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/usecases/get_movie.dart';
import '../video_cubit/video_cubit.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetails;
  final VideoCubit video;
  MovieDetailCubit({
    required this.getMovieDetails,
    required this.video,
  }) : super(MovieDetailInitial());

  void getMovieDetail({required int id}) async {
    emit(MovieDetailLoading());
    final eitherDetailOrError = await getMovieDetails(
      MovieDetailParams(id: id),
    );
    eitherDetailOrError.fold(
        (l) => emit(
              const MovieDetailError(error: ERROR_LOADING_DATA),
            ),
        (detail) => emit(
              MovieDetailLoaded(movieDetail: detail),
            ));

    video.getVideo(id);
  }
}
