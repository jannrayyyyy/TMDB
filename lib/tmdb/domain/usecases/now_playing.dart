import 'package:dartz/dartz.dart';

import '../../core/error/failure/server_failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class NowPlaying implements UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repo;
  NowPlaying({required this.repo});

  @override
  Future<Either<ServerFailure, List<MovieEntity>>> call(NoParams params) async {
    return await repo.getNowPlaying();
  }
}
