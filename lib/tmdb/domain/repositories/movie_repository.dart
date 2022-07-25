import '../entities/genre_entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure/server_failure.dart';
import '../entities/cast_entity.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movie_entity.dart';
import '../entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure, List<MovieEntity>>> getTrending();
  Future<Either<ServerFailure, List<MovieEntity>>> getPopular();
  Future<Either<ServerFailure, List<MovieEntity>>> getNowPlaying();
  Future<Either<ServerFailure, List<MovieEntity>>> getUpComing();
  Future<Either<ServerFailure, MovieDetailEntity>> getSpecMovie(
      {required int id});
  Future<Either<ServerFailure, List<MovieEntity>>> searchMovies(
      {required String query});
  Future<Either<ServerFailure, List<GenreEntity>>> getGenre();
  Future<Either<ServerFailure, List<MovieEntity>>> chooseGenre(
      {required int genreid});
  Future<Either<ServerFailure, List<VideoEntity>>> getVideos(int id);
  Future<Either<ServerFailure, List<CastEntity>>> getCast(int id);
}
