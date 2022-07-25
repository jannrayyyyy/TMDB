import 'package:dartz/dartz.dart';

import '../../core/error/exception/server_exception.dart';
import '../../core/error/failure/server_failure.dart';
import '../../domain/entities/cast_entity.dart';
import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/entities/video_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasource/remote_datasource.dart';
import '../model/genre_model.dart';
import '../model/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remote;
  MovieRepositoryImpl({
    required this.remote,
  });
  @override
  Future<Either<ServerFailure, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remote.getTrending();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remote.getPopular();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getNowPlaying() async {
    try {
      final movies = await remote.getNowPlaying();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getUpComing() async {
    try {
      final movies = await remote.getUpComing();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, MovieDetailEntity>> getSpecMovie({
    required int id,
  }) async {
    try {
      final movieDetail = await remote.getSpecMovie(id: id);
      return Right(movieDetail);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> searchMovies(
      {required String query}) async {
    try {
      final movieresult = await remote.searchMovie(query: query);
      return Right(movieresult);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> chooseGenre(
      {required int genreid}) async {
    try {
      final movieGenres = await remote.chooseGenre(genreid: genreid);
      return Right(movieGenres);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<GenreModel>>> getGenre() async {
    try {
      final genres = await remote.getGenre();
      return Right(genres);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<VideoEntity>>> getVideos(int id) async {
    try {
      final videos = await remote.fetchVideos(id);
      return Right(videos);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<CastEntity>>> getCast(int id) async {
    try {
      final cast = await remote.getCast(id);
      return Right(cast);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
