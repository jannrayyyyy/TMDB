import 'package:dartz/dartz.dart';

import '../../core/error/failure/server_failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class SearchMovie implements UseCase<List<MovieEntity>, SearchMovieParams> {
  final MovieRepository repo;
  SearchMovie({required this.repo});

  @override
  Future<Either<ServerFailure, List<MovieEntity>>> call(
      SearchMovieParams params) async {
    return await repo.searchMovies(query: params.query);
  }
}

class SearchMovieParams {
  final String query;
  SearchMovieParams({required this.query});
}
