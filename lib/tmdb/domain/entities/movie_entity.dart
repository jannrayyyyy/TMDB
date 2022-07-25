import 'package:equatable/equatable.dart';

import 'movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String? title;
  final String? overview;
  final String? releaseDate;
  final String? backdropPath;
  final String? originalTitle;
  final String? posterPath;
  final int? voteCount;
  final double? voteAverage;
  final int? id;
  final List<int>? genres;
  const MovieEntity({
    this.title,
    this.overview,
    this.releaseDate,
    this.backdropPath,
    this.originalTitle,
    this.posterPath,
    this.voteCount,
    this.voteAverage,
    this.id,
    this.genres,
  });
  @override
  List<Object?> get props => [
        id,
        title,
      ];
  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      posterPath: movieDetailEntity.posterPath,
      id: movieDetailEntity.id,
      backdropPath: movieDetailEntity.backdropPath,
      title: movieDetailEntity.title,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
    );
  }
}
