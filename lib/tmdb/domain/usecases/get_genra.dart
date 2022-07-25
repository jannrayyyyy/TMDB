import 'package:dartz/dartz.dart';

import '../../core/error/failure/server_failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetGenres implements UseCase<List<MovieEntity>, ChooseParams> {
  final MovieRepository repo;
  GetGenres({required this.repo});

  @override
  Future<Either<ServerFailure, List<MovieEntity>>> call(
      ChooseParams params) async {
    return await repo.chooseGenre(genreid: params.genreid);
  }
}

class ChooseParams {
  final int genreid;
  ChooseParams({
    required this.genreid,
  });
}
