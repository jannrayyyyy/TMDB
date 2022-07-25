import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failure/server_failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/movie_detail_entity.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetail implements UseCase<MovieDetailEntity, MovieDetailParams> {
  final MovieRepository repo;
  GetMovieDetail({required this.repo});
  @override
  Future<Either<ServerFailure, MovieDetailEntity>> call(
      MovieDetailParams params) async {
    return await repo.getSpecMovie(
      id: params.id,
    );
  }
}

class MovieDetailParams extends Equatable {
  final int id;
  const MovieDetailParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
