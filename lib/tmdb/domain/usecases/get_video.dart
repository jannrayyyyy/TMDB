import 'package:dartz/dartz.dart';

import '../../core/error/failure/server_failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/video_entity.dart';
import '../repositories/movie_repository.dart';

class GetVideo implements UseCase<List<VideoEntity>, VideoParams> {
  final MovieRepository repo;
  GetVideo({required this.repo});

  @override
  Future<Either<ServerFailure, List<VideoEntity>>> call(
      VideoParams params) async {
    return await repo.getVideos(params.id);
  }
}

class VideoParams {
  final int id;
  VideoParams(this.id);
}
